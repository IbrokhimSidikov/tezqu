import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/features/auth/presentation/pages/login_otp_page.dart';
import 'package:tezqu/features/home/presentation/pages/home.dart';
import 'package:tezqu/features/onboard/presentation/pages/onboard.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/expense/presentation/pages/expense.dart';
import '../../features/income/presentation/pages/income.dart';
import '../../features/payments/presentation/pages/details_payment.dart';
import '../../features/payments/presentation/pages/payments.dart';
import '../../features/products/presentation/pages/details.dart';
import '../../features/products/presentation/pages/products.dart';

class AppRoutes {
  static const String onboard = '/onboard';
  static const String home = '/home';
  static const String login = '/login';
  static const String loginOtp = '/loginOtp';
  static const String products = '/products';
  static const String details = '/details';
  static const String income = '/income';
  static const String expense = '/expense';
  static const String payments = '/payments';
  static const String detailsPayment = '/detailsPayment';

  static final GoRouter router = GoRouter(
    initialLocation: detailsPayment,
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
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
          path: loginOtp,
          name: 'loginOtp',
          builder: (context, state) => const LoginOtpPage()
      ),
      GoRoute(
          path: products,
          name: 'products',
          builder: (context, state) => const Products()
      ),
      GoRoute(
        path: details,
        name: 'details',
        builder: (context, state) => const Details(),
      ),
      GoRoute(
        path: income,
        name: 'income',
        builder: (context, state) => const Income(),
      ),
      GoRoute(
        path: expense,
        name: 'expense',
        builder: (context, state) => const Expense(),
      ),
      GoRoute(
        path: payments,
        name: 'payments',
        builder: (context, state) => const Payments(),
      ),
      GoRoute(
        path: detailsPayment,
        name: 'detailsPayment',
        builder: (context, state) => const DetailsPayment(),
      )
    ],
  );
}