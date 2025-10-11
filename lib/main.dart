import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezqu/core/router/app_routes.dart';

import 'core/di/di.dart';
import 'features/onboard/presentation/cubit/splash_screen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: ".env");
  
  // Configure dependency injection
  await configureDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
        return BlocProvider(
          create: (context) => getIt<SplashScreenCubit>(),
          child: MaterialApp.router(
            title: 'TezQu',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 214, 135, 18),
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
      }
    );
  }
}
