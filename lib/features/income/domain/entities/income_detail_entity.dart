import 'package:equatable/equatable.dart';

class IncomeDetailEntity extends Equatable {
  final String userName;
  final List<ContractDetailEntity> contracts;
  final double totalAmount;
  final double totalPaid;

  const IncomeDetailEntity({
    required this.userName,
    required this.contracts,
    required this.totalAmount,
    required this.totalPaid,
  });

  @override
  List<Object?> get props => [userName, contracts, totalAmount, totalPaid];
}

class ContractDetailEntity extends Equatable {
  final String id;
  final String productName;
  final String productCategory;
  final double amount;
  final String status;
  final String? dueDate;
  final String? productImage;

  const ContractDetailEntity({
    required this.id,
    required this.productName,
    required this.productCategory,
    required this.amount,
    required this.status,
    this.dueDate,
    this.productImage,
  });

  @override
  List<Object?> get props => [
        id,
        productName,
        productCategory,
        amount,
        status,
        dueDate,
        productImage,
      ];
}
