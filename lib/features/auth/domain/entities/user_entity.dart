import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? phone;
  final String? name;
  final String? email;
  final String? token;

  const UserEntity({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.token,
  });

  @override
  List<Object?> get props => [id, phone, name, email, token];
}
