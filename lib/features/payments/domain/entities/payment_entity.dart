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

  const PaymentEntity({
    required this.id,
    required this.productName,
    required this.dueDate,
    required this.amount,
    required this.status,
    required this.contractId,
    this.productImage,
    this.productCategory,
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
      ];
}
