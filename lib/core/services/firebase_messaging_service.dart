import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/notification/domain/entities/notification_entity.dart';
import '../../features/notification/presentation/cubit/notification_cubit.dart';
import '../widgets/permission_dialog.dart';

class FirebaseMessagingService {
  static final FirebaseMessagingService _instance = FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;
  FirebaseMessagingService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
  
  final StreamController<RemoteMessage> _messageStreamController = StreamController<RemoteMessage>.broadcast();
  Stream<RemoteMessage> get onMessageStream => _messageStreamController.stream;
  
  GoRouter? _router;
  NotificationCubit? _notificationCubit;
  BuildContext? _context;
  
  void setRouter(GoRouter router) {
    _router = router;
  }
  
  void setNotificationCubit(NotificationCubit cubit) {
    _notificationCubit = cubit;
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> initialize() async {
    print('🔔 ========== FCM INITIALIZATION START ==========');
    await _setupLocalNotifications();
    await _setupMessageHandlers();
    await _getToken();
    await _loadSavedNotifications();
    print('🔔 ========== FCM INITIALIZATION COMPLETE ==========');
  }

  // Static method to save notification to SharedPreferences (for background handler)
  static Future<void> saveNotificationToStorage(RemoteMessage message) async {
    if (message.notification == null) return;
    
    final prefs = await SharedPreferences.getInstance();
    final notifications = prefs.getStringList('saved_notifications') ?? [];
    
    final notificationId = message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();
    
    // Check if notification already exists to prevent duplicates
    final existingIds = notifications.map((json) {
      try {
        final data = jsonDecode(json);
        return data['id'] as String?;
      } catch (e) {
        return null;
      }
    }).where((id) => id != null).toSet();
    
    if (existingIds.contains(notificationId)) {
      print('⚠️ Notification already exists in storage: $notificationId');
      return;
    }
    
    final notification = {
      'id': notificationId,
      'title': message.notification!.title ?? 'Notification',
      'body': message.notification!.body ?? '',
      'data': jsonEncode(message.data),
      'timestamp': DateTime.now().toIso8601String(),
      'isRead': false,
    };
    
    notifications.insert(0, jsonEncode(notification));
    await prefs.setStringList('saved_notifications', notifications);
    print('✅ Notification saved to storage: ${notification['title']}');
  }

  // Load saved notifications from SharedPreferences and sync with cubit
  Future<void> _loadSavedNotifications() async {
    if (_notificationCubit == null) {
      print('⚠️ NotificationCubit is null - cannot load notifications');
      return;
    }
    
    final prefs = await SharedPreferences.getInstance();
    final notifications = prefs.getStringList('saved_notifications') ?? [];
    
    print('📥 Loading ${notifications.length} saved notifications...');
    
    // Get existing notification IDs to prevent duplicates
    final existingIds = _notificationCubit!.state.notifications.map((n) => n.id).toSet();
    
    for (final notificationJson in notifications) {
      try {
        final data = jsonDecode(notificationJson);
        final notificationId = data['id'];
        
        // Skip if notification already exists in cubit
        if (existingIds.contains(notificationId)) {
          continue;
        }
        
        final notification = NotificationEntity(
          id: notificationId,
          title: data['title'],
          body: data['body'],
          data: jsonDecode(data['data']),
          timestamp: DateTime.parse(data['timestamp']),
          isRead: data['isRead'] ?? false,
        );
        _notificationCubit!.addNotification(notification);
        existingIds.add(notificationId);
      } catch (e) {
        print('⚠️ Error loading notification: $e');
      }
    }
    
    print('✅ Loaded saved notifications');
  }

  Future<void> requestPermissionWithDialog() async {
    await _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (_context != null) {
      final shouldRequest = await PermissionDialog.showNotificationPermissionDialog(_context!);
      
      if (!shouldRequest) {
        print('User declined pre-permission dialog');
        return;
      }
    }

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> _setupLocalNotifications() async {
    print('📱 Setting up local notifications...');
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default_channel',
      'Default Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    print('✅ Local notifications setup complete');
  }

  Future<void> _setupMessageHandlers() async {
    print('📨 Setting up message handlers...');
    
    // Foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('\n🔔 ========== NOTIFICATION RECEIVED (FOREGROUND) ==========');
      print('📬 Message ID: ${message.messageId}');
      print('📤 Sent Time: ${message.sentTime}');
      print('📊 Data: ${message.data}');
      print('🔔 Notification: ${message.notification?.toMap()}');
      print('📱 Title: ${message.notification?.title}');
      print('📝 Body: ${message.notification?.body}');
      print('🖼️ Image URL: ${message.notification?.android?.imageUrl ?? message.notification?.apple?.imageUrl}');
      print('🔔 ========================================================\n');

      if (message.notification != null) {
        print('💾 Saving notification to local storage...');
        _saveNotification(message);
        print('📲 Showing local notification...');
        _showLocalNotification(message);
      } else {
        print('⚠️ Message has no notification payload - data-only message');
      }

      _messageStreamController.add(message);
    });

    // Background messages (app in background, notification tapped)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('\n👆 ========== NOTIFICATION TAPPED (BACKGROUND) ==========');
      print('📬 Message ID: ${message.messageId}');
      print('📊 Data: ${message.data}');
      print('👆 ======================================================\n');
      _handleNotificationTap(message);
      _messageStreamController.add(message);
    });

    // Terminated state (app was closed, notification tapped)
    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      print('\n🚀 ========== APP OPENED FROM NOTIFICATION (TERMINATED) ==========');
      print('📬 Message ID: ${initialMessage.messageId}');
      print('📊 Data: ${initialMessage.data}');
      print('🚀 ==================================================================\n');
      _handleNotificationTap(initialMessage);
      _messageStreamController.add(initialMessage);
    } else {
      print('ℹ️ No initial message - app opened normally');
    }
    
    print('✅ Message handlers setup complete');
  }
  
  void _saveNotification(RemoteMessage message) {
    print('💾 Attempting to save notification...');
    if (message.notification != null) {
      // Save to SharedPreferences for persistence
      saveNotificationToStorage(message);
      
      // Also save to cubit if available
      if (_notificationCubit != null) {
        final notification = NotificationEntity(
          id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
          title: message.notification!.title ?? 'Notification',
          body: message.notification!.body ?? '',
          data: message.data,
          timestamp: DateTime.now(),
          isRead: false,
        );
        _notificationCubit!.addNotification(notification);
        print('✅ Notification saved to cubit');
      } else {
        print('⚠️ NotificationCubit is null - saved to storage only');
      }
    } else {
      print('⚠️ Message notification is null - cannot save');
    }
  }
  
  void _handleNotificationTap(RemoteMessage message) {
    if (_router != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _router!.push('/notifications');
      });
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null) {
      print('📲 Showing local notification:');
      print('   Title: ${notification.title}');
      print('   Body: ${notification.body}');
      print('   ID: ${notification.hashCode}');
      
      try {
        await _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'default_channel',
              'Default Notifications',
              channelDescription: 'This channel is used for important notifications.',
              importance: Importance.high,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: message.data.toString(),
        );
        print('✅ Local notification displayed successfully');
      } catch (e) {
        print('❌ Error showing local notification: $e');
      }
    } else {
      print('⚠️ Cannot show local notification - notification is null');
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    print('\n👆 ========== NOTIFICATION TAPPED ==========');
    print('📬 Notification ID: ${response.id}');
    print('📊 Payload: ${response.payload}');
    print('🔔 Action ID: ${response.actionId}');
    print('👆 ==========================================\n');
    if (_router != null) {
      _router!.push('/notifications');
      print('🔀 Navigated to /notifications');
    } else {
      print('⚠️ Router is null - cannot navigate');
    }
  }

  Future<String?> _getToken() async {
    print('🔑 Getting FCM token...');
    
    if (Platform.isIOS) {
      print('🍎 iOS detected - getting APNS token first...');
      String? apnsToken = await _firebaseMessaging.getAPNSToken();
      print('🍎 APNS Token: ${apnsToken ?? "NULL"}');
    }
    
    String? token = await _firebaseMessaging.getToken();
    print('\n🔑 ========== FCM TOKEN ==========');
    print('$token');
    print('🔑 =================================\n');
    
    if (token == null) {
      print('❌ WARNING: FCM Token is NULL!');
    }
    
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      print('\n🔄 ========== FCM TOKEN REFRESHED ==========');
      print('$newToken');
      print('🔄 ========================================\n');
    });

    return token;
  }

  Future<String?> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    print('🔑 FCM Token retrieved: ${token != null ? "${token.substring(0, 20)}..." : "NULL"}');
    return token;
  }

  Future<void> checkNotificationStatus() async {
    print('\n🔍 ========== NOTIFICATION STATUS CHECK ==========');
    
    // Check permissions
    final settings = await _firebaseMessaging.getNotificationSettings();
    print('📋 Authorization Status: ${settings.authorizationStatus}');
    print('   - Authorized: ${settings.authorizationStatus == AuthorizationStatus.authorized}');
    print('   - Denied: ${settings.authorizationStatus == AuthorizationStatus.denied}');
    print('   - Not Determined: ${settings.authorizationStatus == AuthorizationStatus.notDetermined}');
    print('   - Provisional: ${settings.authorizationStatus == AuthorizationStatus.provisional}');
    
    print('🔔 Alert Setting: ${settings.alert}');
    print('🔊 Sound Setting: ${settings.sound}');
    print('🔴 Badge Setting: ${settings.badge}');
    
    // Get token
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      print('✅ FCM Token exists: ${token.substring(0, 30)}...');
    } else {
      print('❌ FCM Token is NULL!');
    }
    
    // Check APNS token for iOS
    if (Platform.isIOS) {
      final apnsToken = await _firebaseMessaging.getAPNSToken();
      if (apnsToken != null) {
        print('✅ APNS Token exists: ${apnsToken.substring(0, 20)}...');
      } else {
        print('❌ APNS Token is NULL! This might prevent notifications on iOS.');
      }
    }
    
    print('🔍 ================================================\n');
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    print('Subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    print('Unsubscribed from topic: $topic');
  }

  void dispose() {
    _messageStreamController.close();
  }
}
