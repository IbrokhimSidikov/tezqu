import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/pages/home.dart';
import 'package:tezqu/features/onboard/presentation/pages/onboard.dart';

class AppRoutes {
  static const String onboard = '/onboard';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    initialLocation: onboard,
    routes: [
      GoRoute(
        path: onboard,
        name: 'onboard',
        builder: (context, state) => const Onboard(),
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}