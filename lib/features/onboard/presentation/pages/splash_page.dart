import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/core/constants/app_colors.dart';
import 'package:tezqu/core/constants/app_images.dart';
import 'package:tezqu/core/router/app_routes.dart';
import 'package:tezqu/features/onboard/presentation/cubit/splash_screen_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Trigger the initial route check
    context.read<SplashScreenCubit>().checkInitialRoute();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        state.when(
          loading: () {},
          onboarding: () {
            context.go(AppRoutes.onboard);
          },
          auth: () {
            context.go(AppRoutes.login);
          },
          main: () {
            context.go(AppRoutes.home);
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.cx43C19F,
        body: Center(
          child: SvgPicture.asset(
            AppImages.logoOnboard,
            height: 100,
            width: 150,
          ),
        ),
      ),
    );
  }
}
