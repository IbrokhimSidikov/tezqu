import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  /// Register a new user
  /// POST /auth/register
  Future<Either<Failure, UserEntity>> register({
    required String firstName,
    required String lastName,
    String? dateOfBirth,
    required String gender,
    required String phoneNumber,
  });

  /// Verify phone with OTP code
  /// POST /auth/verify
  Future<Either<Failure, UserEntity>> verify({
    required String phone,
    required String code,
  });

  /// Login with phone and password/code
  /// POST /auth/login
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String code,
  });

  /// Send verification code to phone
  /// POST /auth/send-code
  Future<Either<Failure, void>> sendCode({
    required String phone,
  });

  /// Send login code to phone
  /// POST /auth/login
  Future<Either<Failure, void>> sendLoginCode({
    required String phone,
  });

  /// Logout user
  Future<Either<Failure, void>> logout();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Get current user
  Future<UserEntity?> getCurrentUser();
}
