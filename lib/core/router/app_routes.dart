import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/features/auth/presentation/pages/login_otp_page.dart';
import 'package:tezqu/features/contracts/domain/entities/contract_entity.dart';
import 'package:tezqu/features/contracts/presentation/pages/contract_details.dart';
import 'package:tezqu/features/contracts/presentation/pages/contracts.dart';
import 'package:tezqu/features/home/presentation/pages/home.dart';
import 'package:tezqu/features/onboard/presentation/pages/onboard.dart';
import 'package:tezqu/features/onboard/presentation/pages/splash_page.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/expense/presentation/pages/expense.dart';
import '../../features/home/presentation/pages/favourites.dart';
import '../../features/income/presentation/pages/income.dart';
import '../../features/notification/presentation/pages/notifications.dart';
import '../../features/payments/presentation/pages/details_payment.dart';
import '../../features/payments/presentation/pages/payments.dart';
import '../../features/products/presentation/pages/details.dart';
import '../../features/products/presentation/pages/products.dart';
import '../../features/profile/presentation/pages/profile.dart';
import '../../features/warehouse/presentation/pages/warehouse.dart';

class AppRoutes {
  static const String splash = '/';
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
  static const String warehouse = '/warehouse';
  static const String auth = '/auth';
  static const String profile = '/profile';
  static const String favourites = '/favourites';
  static const String notifications = '/notifications';
  static const String contracts = '/contracts';
  static const String contractDetails = '/contractDetails';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
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
          builder: (context, state) {
            final phone = state.uri.queryParameters['phone'] ?? '';
            return LoginOtpPage(phoneNumber: phone);
          }
      ),
      GoRoute(
        path: auth,
        name: 'auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
          path: products,
          name: 'products',
          builder: (context, state) => const Products()
      ),
      GoRoute(
        path: details,
        name: 'details',
        builder: (context, state) {
          final product = state.extra;
          return Details(product: product);
        },
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
        builder: (context, state) {
          final contractId = state.uri.queryParameters['contractId'] ?? '0';
          return DetailsPayment(contractId: int.parse(contractId));
        },
      ),
      GoRoute(
        path: warehouse,
        name: 'warehouse',
        builder: (context, state) => const Warehouse(),
      ),
      GoRoute(
        path: '/profile',
        name: AppRoutes.profile,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Profile(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0); // 👈 from the left
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path:favourites,
        name: 'favourites',
        builder: (context, state) => const Favourites(),
      ),
      GoRoute(
          path: notifications,
          name: 'notifications',
          builder: (context, state) => const Notifications(),
      ),
      GoRoute(
        path: contracts,
        name: 'contracts',
        builder: (context, state) => const ContractsPage(),
      ),
      GoRoute(
        path: contractDetails,
        name: 'contractDetails',
        builder: (context, state) {
          final contract = state.extra != null ? state.extra as ContractItemEntity : null;
          return ContractDetails(contract: contract);
        },
      ),
    ],
  );
}