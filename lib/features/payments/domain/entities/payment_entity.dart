import 'package:equatable/equatable.dart';

class PaymentsEntity extends Equatable {
  final List<PaymentEntity> nextPayments;
  final List<PaymentEntity> paidPayments;
  final SummaryEntity? summary;

  const PaymentsEntity({
    required this.nextPayments,
    required this.paidPayments,
    this.summary,
  });

  @override
  List<Object?> get props => [nextPayments, paidPayments, summary];
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
  final String? productId;
  final ProductEntity? product;
  final String? serviceContractPdf;

  const ContractEntity({
    required this.id,
    this.productId,
    this.product,
    this.serviceContractPdf,
  });

  @override
  List<Object?> get props => [id, productId, product, serviceContractPdf];
}

class ProductEntity extends Equatable {
  final String? id;
  final String name;
  final Map<String, dynamic> customFields;

  const ProductEntity({
    this.id,
    required this.name,
    required this.customFields,
  });

  @override
  List<Object?> get props => [id, name, customFields];
}

class SummaryEntity extends Equatable {
  final int totalContracts;
  final int totalPayments;
  final int paidCount;
  final int remainingCount;
  final double totalPaid;
  final double totalRemaining;
  final int completionPercentage;

  const SummaryEntity({
    required this.totalContracts,
    required this.totalPayments,
    required this.paidCount,
    required this.remainingCount,
    required this.totalPaid,
    required this.totalRemaining,
    required this.completionPercentage,
  });

  @override
  List<Object?> get props => [
        totalContracts,
        totalPayments,
        paidCount,
        remainingCount,
        totalPaid,
        totalRemaining,
        completionPercentage,
      ];
}
