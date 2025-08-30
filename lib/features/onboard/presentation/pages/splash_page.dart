import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezqu/core/constants/app_images.dart';
import 'package:tezqu/core/shared/app_scaffold.dart';
import 'package:tezqu/features/onboard/presentation/cubit/splash_screen_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenCubit, SplashScreenState>(
      builder: (context, state) {
        return AppScaffold(
          child: Center(),
        );
      },
    );
  }
}
