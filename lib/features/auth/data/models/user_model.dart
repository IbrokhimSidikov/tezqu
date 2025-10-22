import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? phone,
    String? name,
    String? email,
    @JsonKey(name: 'access_token') String? token,
    String? firstName,
    String? lastName,
    String? role,
  }) = _UserModel;
  
  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Handle nested 'user' object from verify/login response
    final userData = json['user'] as Map<String, dynamic>? ?? json;
    
    // Handle both 'token' and 'access_token' field names
    final token = json['access_token'] as String? ?? json['token'] as String?;
    
    return UserModel(
      id: userData['id'] as String?,
      phone: userData['phone_number'] as String? ?? userData['phone'] as String?,
      name: userData['name'] as String?,
      email: userData['email'] as String?,
      token: token,
      firstName: userData['first_name'] as String?,
      lastName: userData['last_name'] as String?,
      role: userData['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
      'access_token': token,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
    };
  }

  // Convert to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      phone: phone,
      name: name,
      email: email,
      token: token,
      firstName: firstName,
      lastName: lastName,
      role: role,
    );
  }

  // Create from entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      phone: entity.phone,
      name: entity.name,
      email: entity.email,
      token: entity.token,
      firstName: entity.firstName,
      lastName: entity.lastName,
      role: entity.role,
    );
  }

  @override
  // TODO: implement email
  String? get email => throw UnimplementedError();

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();

  @override
  // TODO: implement name
  String? get name => throw UnimplementedError();

  @override
  // TODO: implement phone
  String? get phone => throw UnimplementedError();

  @override
  // TODO: implement token
  String? get token => throw UnimplementedError();

  @override
  // TODO: implement firstName
  String? get firstName => throw UnimplementedError();

  @override
  // TODO: implement lastName
  String? get lastName => throw UnimplementedError();

  @override
  // TODO: implement role
  String? get role => throw UnimplementedError();
}
