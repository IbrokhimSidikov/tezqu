import 'package:flutter/material.dart';
import 'package:tezqu/core/router/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TezQu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 214, 135, 18)),
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
    );
  }
}
