import 'package:equatable/equatable.dart';

class IncomeSourcesEntity extends Equatable {
  final List<IncomeSourceEntity> collectors;
  final List<IncomeSourceEntity> clients;
  final List<IncomeSourceEntity> investors;

  const IncomeSourcesEntity({
    required this.collectors,
    required this.clients,
    required this.investors,
  });

  @override
  List<Object?> get props => [collectors, clients, investors];
}

class IncomeSourceEntity extends Equatable {
  final String id;
  final String name;
  final double amount;
  final String status;
  final String? image;

  const IncomeSourceEntity({
    required this.id,
    required this.name,
    required this.amount,
    required this.status,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, amount, status, image];
}
