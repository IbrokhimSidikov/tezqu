import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../error/exceptions.dart';

@lazySingleton
class DioClient {
  late final Dio _dio;
  final SharedPreferences _prefs;

  DioClient(this._prefs) {
    _dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? 'https://api.tezqu.uz',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add auth token if exists
          final token = _prefs.getString('auth_token');
          if (kDebugMode) {
            print('🔑 Token from SharedPreferences: ${token != null ? "EXISTS (${token.substring(0, 20)}...)" : "NULL"}');
          }
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            if (kDebugMode) {
              print('✅ Authorization header added');
            }
          } else {
            if (kDebugMode) {
              print('❌ No token found - request will be unauthorized');
            }
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired or invalid - clear token
            await _prefs.remove('auth_token');
            // You can navigate to login here if needed
          }
          return handler.next(error);
        },
      ),
    );

    // Add pretty logger for debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
        ),
      );
    }
  }

  // GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Error handler
  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(message: 'Ulanish vaqti tugadi');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data['message'] ?? 
                       error.response?.data['error'] ?? 
                       'Server xatosi yuz berdi';
        
        if (statusCode == 401) {
          return UnauthorizedException(message: _translateErrorMessage(message));
        }
        
        if (statusCode == 409) {
          // Handle conflict errors (e.g., user already registered)
          return ServerException(
            message: _translateErrorMessage(message),
            statusCode: statusCode,
          );
        }
        
        return ServerException(
          message: _translateErrorMessage(message),
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return ServerException(message: 'So\'rov bekor qilindi');
      case DioExceptionType.connectionError:
        return NetworkException(message: 'Internet aloqasi yo\'q');
      case DioExceptionType.badCertificate:
        return ServerException(message: 'Sertifikat xatosi');
      case DioExceptionType.unknown:
      default:
        return ServerException(
          message: error.message ?? 'Noma\'lum xato yuz berdi',
        );
    }
  }

  // Translate common error messages to Uzbek
  String _translateErrorMessage(String message) {
    // Convert to lowercase for case-insensitive matching
    final lowerMessage = message.toLowerCase();
    
    // Check for specific error patterns
    if (lowerMessage.contains('already registered') || 
        lowerMessage.contains('user already registered')) {
      return 'Bu raqam allaqachon ro\'yxatdan o\'tgan. Iltimos, tizimga kiring.';
    }
    
    if (lowerMessage.contains('invalid credentials') || 
        lowerMessage.contains('wrong password')) {
      return 'Login yoki parol noto\'g\'ri';
    }
    
    if (lowerMessage.contains('user not found') || 
        lowerMessage.contains('not found')) {
      return 'Foydalanuvchi topilmadi';
    }
    
    if (lowerMessage.contains('invalid code') || 
        lowerMessage.contains('wrong code')) {
      return 'Noto\'g\'ri kod kiritildi';
    }
    
    if (lowerMessage.contains('code expired')) {
      return 'Kod muddati tugagan';
    }
    
    if (lowerMessage.contains('unauthorized')) {
      return 'Ruxsat berilmagan';
    }
    
    if (lowerMessage.contains('forbidden')) {
      return 'Taqiqlangan';
    }
    
    if (lowerMessage.contains('server error') || 
        lowerMessage.contains('internal server error')) {
      return 'Server xatosi yuz berdi';
    }
    
    if (lowerMessage.contains('bad request')) {
      return 'Noto\'g\'ri so\'rov';
    }
    
    if (lowerMessage.contains('network error') || 
        lowerMessage.contains('connection')) {
      return 'Tarmoq xatosi';
    }
    
    // If no translation found, return original message
    return message;
  }

  // Save token
  Future<void> saveToken(String token) async {
    await _prefs.setString('auth_token', token);
  }

  // Get token
  String? getToken() {
    return _prefs.getString('auth_token');
  }

  // Clear token
  Future<void> clearToken() async {
    await _prefs.remove('auth_token');
  }
}
