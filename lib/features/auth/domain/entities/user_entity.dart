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

  const UserEntity({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.token,
    this.firstName,
    this.lastName,
    this.role,
  });

  @override
  List<Object?> get props => [id, phone, name, email, token, firstName, lastName, role];
}
