import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register({
    required String firstName,
    required String lastName,
    String? dateOfBirth,
    String? gender,
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

  Future<void> updateFcmToken({
    required String fcmToken,
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
    String? dateOfBirth,
    String? gender,
    required String phoneNumber,
  }) async {
    final data = {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
    
    if (dateOfBirth != null && dateOfBirth.isNotEmpty) {
      data['date_of_birth'] = dateOfBirth;
    }
    
    if (gender != null && gender.isNotEmpty) {
      data['gender'] = gender;
    }
    
    final response = await dioClient.post(
      '/auth/register',
      data: data,
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
    print('🔍 Login API Response: $userData');
    
    final userModel = UserModel.fromJson(userData);
    print('🔍 UserModel token: ${userModel.token}');
    
    // Save token if available
    if (userModel.token != null) {
      print('💾 Saving token to SharedPreferences...');
      await dioClient.saveToken(userModel.token!);
      print('✅ Token saved successfully');
    } else {
      print('⚠️ No token found in user model!');
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

  @override
  Future<void> updateFcmToken({
    required String fcmToken,
  }) async {
    await dioClient.post(
      '/user/fcm-token',
      data: {
        'fcm_token': fcmToken,
      },
    );
  }
}
