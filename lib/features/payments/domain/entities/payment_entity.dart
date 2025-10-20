import 'package:equatable/equatable.dart';

class PaymentsEntity extends Equatable {
  final List<PaymentEntity> nextPayments;
  final List<PaymentEntity> paidPayments;

  const PaymentsEntity({
    required this.nextPayments,
    required this.paidPayments,
  });

  @override
  List<Object?> get props => [nextPayments, paidPayments];
}

class PaymentEntity extends Equatable {
  final int id;
  final String productName;
  final String dueDate;
  final double amount;
  final String status;
  final int contractId;
  final String? productImage;
  final String? productCategory;
  final ContractEntity? contract;

  const PaymentEntity({
    required this.id,
    required this.productName,
    required this.dueDate,
    required this.amount,
    required this.status,
    required this.contractId,
    this.productImage,
    this.productCategory,
    this.contract,
  });

  @override
  List<Object?> get props => [
        id,
        productName,
        dueDate,
        amount,
        status,
        contractId,
        productImage,
        productCategory,
        contract,
      ];
}

class ContractEntity extends Equatable {
  final int id;
  final ProductEntity? product;

  const ContractEntity({
    required this.id,
    this.product,
  });

  @override
  List<Object?> get props => [id, product];
}

class ProductEntity extends Equatable {
  final String name;
  final Map<String, dynamic> customFields;

  const ProductEntity({
    required this.name,
    required this.customFields,
  });

  @override
  List<Object?> get props => [name, customFields];
}
