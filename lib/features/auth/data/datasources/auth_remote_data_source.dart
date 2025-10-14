import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
  });

  Future<UserModel> verify({
    required String phone,
    required String code,
  });

  Future<UserModel> login({
    required String phone,
    required String code,
  });

  Future<void> sendCode({
    required String phone,
  });

  Future<void> sendLoginCode({
    required String phone,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
  }) async {
    final response = await dioClient.post(
      '/auth/register',
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth,
        'gender': gender,
        'phone_number': phoneNumber,
      },
    );

    final userData = response.data['data'] ?? response.data;
    return UserModel.fromJson(userData);
  }

  @override
  Future<UserModel> verify({
    required String phone,
    required String code,
  }) async {
    final response = await dioClient.post(
      '/auth/verify',
      data: {
        'phone': phone,
        'code': code,
      },
    );

    final userData = response.data['data'] ?? response.data;
    final userModel = UserModel.fromJson(userData);
    
    // Save token if available
    if (userModel.token != null) {
      await dioClient.saveToken(userModel.token!);
    }
    
    return userModel;
  }

  @override
  Future<UserModel> login({
    required String phone,
    required String code,
  }) async {
    final response = await dioClient.post(
      '/auth/verify',
      data: {
        'phone_number': phone,
        'code': code,
      },
    );

    final userData = response.data['data'] ?? response.data;
    final userModel = UserModel.fromJson(userData);
    
    // Save token if available
    if (userModel.token != null) {
      await dioClient.saveToken(userModel.token!);
    }
    
    return userModel;
  }

  @override
  Future<void> sendCode({
    required String phone,
  }) async {
    await dioClient.post(
      '/auth/send-code',
      data: {
        'phone': phone,
      },
    );
  }

  @override
  Future<void> sendLoginCode({
    required String phone,
  }) async {
    await dioClient.post(
      '/auth/login',
      data: {
        'phone_number': phone,
      },
    );
  }
}
