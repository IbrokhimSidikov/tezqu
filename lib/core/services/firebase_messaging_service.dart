import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
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
    await _setupLocalNotifications();
    await _setupMessageHandlers();
    await _getToken();
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
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        _saveNotification(message);
        _showLocalNotification(message);
      }

      _messageStreamController.add(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
      _saveNotification(message);
      _handleNotificationTap(message);
      _messageStreamController.add(message);
    });

    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      print('App opened from terminated state via notification');
      _saveNotification(initialMessage);
      _handleNotificationTap(initialMessage);
      _messageStreamController.add(initialMessage);
    }
  }
  
  void _saveNotification(RemoteMessage message) {
    if (_notificationCubit != null && message.notification != null) {
      final notification = NotificationEntity(
        id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification!.title ?? 'Notification',
        body: message.notification!.body ?? '',
        data: message.data,
        timestamp: DateTime.now(),
        isRead: false,
      );
      _notificationCubit!.addNotification(notification);
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
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    print('Notification tapped with payload: ${response.payload}');
    if (_router != null) {
      _router!.push('/notifications');
    }
  }

  Future<String?> _getToken() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.getAPNSToken();
    }
    
    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
    
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      print('FCM Token refreshed: $newToken');
    });

    return token;
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
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
