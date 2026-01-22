import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezqu/core/constants/app_colors.dart';
import 'package:tezqu/core/router/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/di.dart';
import 'core/providers/locale_provider.dart';
import 'core/services/firebase_messaging_service.dart';
import 'core/services/version_service.dart';
import 'core/widgets/force_update_dialog.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  
  await dotenv.load(fileName: ".env");
  
  await configureDependencies();
  
  await FirebaseMessagingService().initialize();
  
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

  @override
  void initState() {
    super.initState();
    _initializeApp();
    WidgetsBinding.instance.addObserver(this);
    FirebaseMessagingService().setRouter(AppRoutes.router);
    FirebaseMessagingService().setNotificationCubit(_notificationCubit);
  }

  Future<void> _initializeApp() async {
    await _initializeVersionService();
    await _checkForUpdates();
    await _localeProvider.initialize();
  }

  @override
  void dispose() {
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
    // Wait a bit to ensure the app UI is fully loaded
    await Future.delayed(const Duration(milliseconds: 800));

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
