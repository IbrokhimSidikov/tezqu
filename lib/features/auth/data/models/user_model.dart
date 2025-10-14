import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? phone,
    String? name,
    String? email,
    @JsonKey(name: 'access_token') String? token,
  }) = _UserModel;
  
  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Handle both 'token' and 'access_token' field names
    final token = json['access_token'] as String? ?? json['token'] as String?;
    return UserModel(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      token: token,
    );
  }

  // Convert to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      phone: phone,
      name: name,
      email: email,
      token: token,
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
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement token
  String? get token => throw UnimplementedError();
}
