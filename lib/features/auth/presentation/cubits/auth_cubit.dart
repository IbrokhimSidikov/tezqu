import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/send_code_usecase.dart';
import '../../domain/usecases/send_login_code_usecase.dart';
import '../../domain/usecases/verify_usecase.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyUseCase verifyUseCase;
  final SendCodeUseCase sendCodeUseCase;
  final SendLoginCodeUseCase sendLoginCodeUseCase;
  final LogoutUseCase logoutUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.verifyUseCase,
    required this.sendCodeUseCase,
    required this.sendLoginCodeUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial());

  /// Register new user
  Future<void> register({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
  }) async {
    emit(AuthLoading());

    final result = await registerUseCase(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      phoneNumber: phoneNumber,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(
        user,
        message: 'Ro\'yxatdan o\'tish muvaffaqiyatli',
      )),
    );
  }

  /// Verify phone with OTP code
  Future<void> verify({
    required String phone,
    required String code,
  }) async {
    emit(AuthLoading());

    final result = await verifyUseCase(
      phone: phone,
      code: code,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(
        user,
        message: 'Telefon raqam tasdiqlandi',
      )),
    );
  }

  /// Login user
  Future<void> login({
    required String phone,
    required String code,
  }) async {
    emit(AuthLoading());

    final result = await loginUseCase(
      phone: phone,
      code: code,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(
        user,
        message: 'Xush kelibsiz!',
      )),
    );
  }

  /// Send verification code
  Future<void> sendCode({
    required String phone,
  }) async {
    emit(AuthLoading());

    final result = await sendCodeUseCase(phone: phone);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const CodeSent('Kod yuborildi')),
    );
  }

  /// Send login code
  Future<void> sendLoginCode({
    required String phone,
  }) async {
    emit(AuthLoading());

    final result = await sendLoginCodeUseCase(phone: phone);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const CodeSent('Kod yuborildi')),
    );
  }

  /// Logout user
  Future<void> logout() async {
    emit(AuthLoading());

    final result = await logoutUseCase();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  /// Reset state
  void resetState() {
    emit(AuthInitial());
  }
}
