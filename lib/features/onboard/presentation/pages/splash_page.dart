import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/core/constants/app_colors.dart';
import 'package:tezqu/core/constants/app_images.dart';
import 'package:tezqu/core/router/app_routes.dart';
import 'package:tezqu/core/utils/version_checker.dart';
import 'package:tezqu/features/onboard/presentation/cubit/splash_screen_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  bool _updateCheckDone = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..repeat();
    _checkVersionAndProceed();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _checkVersionAndProceed() async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (mounted) {
      final needsUpdate = await VersionChecker.checkAndShowUpdateDialog(context);
      
      if (!needsUpdate && mounted) {
        _updateCheckDone = true;
        context.read<SplashScreenCubit>().checkInitialRoute();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        if (_updateCheckDone) {
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
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.cx43C19F,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.logoOnboard,
                height: 100,
                width: 150,
              ),
              const SizedBox(height: 40),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final delay = index * 0.2;
                      final value = (_animationController.value - delay) % 1.0;
                      final scale = value < 0.5
                          ? 1.0 + (value * 2) * 0.5
                          : 1.5 - ((value - 0.5) * 2) * 0.5;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Transform.scale(
                          scale: scale,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
