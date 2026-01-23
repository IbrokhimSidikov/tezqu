import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? phone;
  final String? name;
  final String? email;
  final String? token;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? dateOfBirth;
  final String? gender;
  final String? status;
  final Map<String, dynamic>? profileInfo;
  final String? lastLoginAt;
  final String? createdAt;

  const UserEntity({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.token,
    this.firstName,
    this.lastName,
    this.role,
    this.dateOfBirth,
    this.gender,
    this.status,
    this.profileInfo,
    this.lastLoginAt,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, phone, name, email, token, firstName, lastName, role, dateOfBirth, gender, status, profileInfo, lastLoginAt, createdAt];
}
