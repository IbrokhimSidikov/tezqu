import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezqu/core/constants/app_colors.dart';
import 'package:tezqu/core/router/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/di/di.dart';
import 'core/events/auth_event_bus.dart';
import 'core/providers/locale_provider.dart';
import 'core/services/firebase_messaging_service.dart';
import 'core/services/version_service.dart';
import 'core/widgets/force_update_dialog.dart';
import 'features/onboard/presentation/pages/splash_page.dart';
import 'l10n/app_localizations.dart';
import 'l10n/app_localizations_delegate.dart';
import 'features/notification/presentation/cubit/notification_cubit.dart';
import 'features/onboard/presentation/cubit/splash_screen_cubit.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  print('🚀 ========== APP STARTING ==========');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  print('🔥 Initializing Firebase...');
  await Firebase.initializeApp();
  print('✅ Firebase initialized');
  
  print('📨 Setting up background message handler...');
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  print('✅ Background handler set');
  
  print('💉 Configuring dependencies...');
  await configureDependencies();
  print('✅ Dependencies configured');
  
  print('🔔 Initializing Firebase Messaging Service...');
  await FirebaseMessagingService().initialize();
  print('✅ Firebase Messaging Service initialized');
  
  // Request notification permissions immediately
  print('🔐 Requesting notification permissions...');
  final messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  
  print('📋 Permission status: ${settings.authorizationStatus}');
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('✅ User granted notification permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('⚠️ User granted provisional permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print('❌ User denied notification permission');
  } else {
    print('❓ Permission status: ${settings.authorizationStatus}');
  }
  
  // Run diagnostic check
  await FirebaseMessagingService().checkNotificationStatus();
  
  print('🚀 ========== APP START COMPLETE ==========\n');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final NotificationCubit _notificationCubit = NotificationCubit();
  late final VersionService _versionService;
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _localeProvider = LocaleProvider();
  StreamSubscription<void>? _unauthorizedSubscription;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
    _setupUnauthorizedListener();
    WidgetsBinding.instance.addObserver(this);
    FirebaseMessagingService().setRouter(AppRoutes.router);
    FirebaseMessagingService().setNotificationCubit(_notificationCubit);
  }

  void _setupUnauthorizedListener() {
    _unauthorizedSubscription = AuthEventBus().onUnauthorized.listen((_) {
      final context = AppRoutes.navigatorKey.currentContext;
      if (context != null && mounted) {
        AppRoutes.router.go(AppRoutes.login);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sessiya tugadi. Iltimos, qaytadan kiring.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }

  Future<void> _initializeApp() async {
    await _localeProvider.initialize();
    await _initializeVersionService();
    
    FlutterNativeSplash.remove();
    
    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
    
    _checkForUpdates();
  }

  @override
  void dispose() {
    _unauthorizedSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _notificationCubit.close();
    super.dispose();
  }

  Future<void> _initializeVersionService() async {
    try {
      // Initialize Remote Config
      final remoteConfig = FirebaseRemoteConfig.instance;
      _versionService = VersionService(remoteConfig);
      await _versionService.initialize();
    } catch (e) {
      print('Error initializing version service: $e');
    }
  }

  Future<void> _checkForUpdates() async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final updateStatus = await _versionService.checkForUpdate();

      print('🔍 Update check result:');
      print('  Current version: ${updateStatus.currentVersion}');
      print('  Minimum required: ${updateStatus.minimumRequiredVersion}');
      print('  Latest version: ${updateStatus.latestVersion}');
      print('  Update required: ${updateStatus.isUpdateRequired}');
      print('  Update available: ${updateStatus.isUpdateAvailable}');

      // Show update dialog if needed
      if (updateStatus.isUpdateRequired || updateStatus.isUpdateAvailable) {
        final context = _navigatorKey.currentContext;
        if (context != null && mounted) {
          showDialog(
            context: context,
            barrierDismissible: !updateStatus.isUpdateRequired,
            builder: (context) => ForceUpdateDialog(
              updateStatus: updateStatus,
            ),
          );
        } else {
          print('⚠️ Navigator context not available yet, retrying...');
          await Future.delayed(const Duration(milliseconds: 500));
          _checkForUpdates();
        }
      }
    } catch (e) {
      print('❌ Error checking for updates: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return BlocProvider(
        create: (context) => getIt<SplashScreenCubit>(),
        child: const SplashPage(),
      );
    }

    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
        return ChangeNotifierProvider.value(
          value: _localeProvider,
          child: Consumer<LocaleProvider>(
            builder: (context, localeProvider, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<SplashScreenCubit>()),
                  BlocProvider.value(value: _notificationCubit),
                ],
                child: MaterialApp.router(
                  title: 'TezQu',
                  debugShowCheckedModeBanner: false,
                  locale: localeProvider.locale,
                  localizationsDelegates: const [
                    AppLocalizationsDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'),
                    Locale('uz'),
                    Locale('ru'),
                  ],
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: AppColors.cxWhite,
                    ),
                    useMaterial3: true,
                    fontFamily: 'SFCompact',
                    textTheme: const TextTheme(
                      bodyMedium: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  routerConfig: AppRoutes.router,
                ),
              );
            },
          ),
        );
      }
    );
  }
}
