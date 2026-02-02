import 'package:equatable/equatable.dart';

class CollectablesEntity extends Equatable {
  final List<CollectableContractEntity> contracts;

  const CollectablesEntity({
    required this.contracts,
  });

  @override
  List<Object?> get props => [contracts];
}

class CollectableContractEntity extends Equatable {
  final String id;
  final String productId;
  final String userId;
  final String? approvedByAdmin;
  final String contractType;
  final String? collectorId;
  final String paymentType;
  final List<CollectablePaymentEntity> payments;
  final UserInfoEntity? user;
  final ProductInfoEntity? product;
  final CollectorInfoEntity? collector;

  const CollectableContractEntity({
    required this.id,
    required this.productId,
    required this.userId,
    this.approvedByAdmin,
    required this.contractType,
    this.collectorId,
    required this.paymentType,
    required this.payments,
    this.user,
    this.product,
    this.collector,
  });

  @override
  List<Object?> get props => [
        id,
        productId,
        userId,
        approvedByAdmin,
        contractType,
        collectorId,
        paymentType,
        payments,
        user,
        product,
        collector,
      ];
}

class CollectorInfoEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? role;

  const CollectorInfoEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.role,
  });

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return firstName ?? lastName ?? 'Unknown Collector';
  }

  @override
  List<Object?> get props => [id, firstName, lastName, phoneNumber, role];
}

class CollectablePaymentEntity extends Equatable {
  final String id;
  final String contractId;
  final String currencyId;
  final String? collectorId;
  final int paymentNumber;
  final String dueDate;
  final double amount;
  final double amountPaid;
  final double amountRemaining;
  final String status;
  final String? paidDate;
  final String? paymentMethodId;
  final int daysOverdue;
  final bool reminderSent;
  final String createdAt;

  const CollectablePaymentEntity({
    required this.id,
    required this.contractId,
    required this.currencyId,
    this.collectorId,
    required this.paymentNumber,
    required this.dueDate,
    required this.amount,
    required this.amountPaid,
    required this.amountRemaining,
    required this.status,
    this.paidDate,
    this.paymentMethodId,
    required this.daysOverdue,
    required this.reminderSent,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        contractId,
        currencyId,
        collectorId,
        paymentNumber,
        dueDate,
        amount,
        amountPaid,
        amountRemaining,
        status,
        paidDate,
        paymentMethodId,
        daysOverdue,
        reminderSent,
        createdAt,
      ];
}

class UserInfoEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  const UserInfoEntity({
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return firstName ?? lastName ?? 'Unknown';
  }

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber];
}

class ProductInfoEntity extends Equatable {
  final String? name;
  final String? category;
  final List<String>? imageUrls;

  const ProductInfoEntity({
    this.name,
    this.category,
    this.imageUrls,
  });

  @override
  List<Object?> get props => [name, category, imageUrls];
}
