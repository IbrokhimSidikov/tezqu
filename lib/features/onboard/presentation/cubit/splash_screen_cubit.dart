import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/core/services/storage_service.dart';
import 'package:tezqu/features/auth/data/datasources/auth_local_data_source.dart';

part 'splash_screen_state.dart';
part 'splash_screen_cubit.freezed.dart';

@injectable
class SplashScreenCubit extends Cubit<SplashScreenState> {
  final StorageService _storageService;
  final AuthLocalDataSource _authLocalDataSource;

  SplashScreenCubit(
    this._storageService,
    this._authLocalDataSource,
  ) : super(const SplashScreenState.loading());

  Future<void> checkInitialRoute() async {
    // Add a small delay for splash screen visibility
    await Future.delayed(const Duration(seconds: 1));

    // Check if user is logged in
    final isLoggedIn = await _authLocalDataSource.isLoggedIn();
    if (isLoggedIn) {
      emit(const SplashScreenState.main());
      return;
    }

    // Check if onboarding is complete
    final isOnboardingComplete = await _storageService.isOnboardingComplete();
    if (isOnboardingComplete) {
      emit(const SplashScreenState.auth());
    } else {
      emit(const SplashScreenState.onboarding());
    }
  }
}
