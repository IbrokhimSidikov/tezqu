part of 'splash_screen_cubit.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.loading() = _Loading;
  const factory SplashScreenState.onboarding() = _Onboarding;
  const factory SplashScreenState.auth() = _Auth;
  const factory SplashScreenState.main() = _Main;

}
