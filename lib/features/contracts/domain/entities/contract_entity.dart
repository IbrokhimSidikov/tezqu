import 'package:equatable/equatable.dart';

class ContractsEntity extends Equatable {
  final List<ContractGroupEntity> contractGroups;

  const ContractsEntity({
    required this.contractGroups,
  });

  @override
  List<Object?> get props => [contractGroups];
}

class ContractGroupEntity extends Equatable {
  final String date;
  final List<ContractItemEntity> contracts;

  const ContractGroupEntity({
    required this.date,
    required this.contracts,
  });

  @override
  List<Object?> get props => [date, contracts];
}

class ContractItemEntity extends Equatable {
  final String id;
  final String vehicleName;
  final String clientName;
  final String clientId;
  final String? status;
  final String? vehicleImage;
  final String? contractType;
  final String? totalServiceFee;
  final String? serviceContractPdf;
  final String? productName;
  final String? collectorFirstName;
  final String? collectorLastName;
  final String? totalPrice;
  final String? initialPayment;
  final String? installmentAmount;
  final int? installmentPeriodMonths;
  final String? interestRate;
  final String? totalInterest;
  final String? monthlyPayment;
  final String? productPrice;
  final String? userFirstName;
  final String? userLastName;
  final String? approvedByAdminFirstName;
  final String? approvedByAdminLastName;
  final List<String>? productImageUrls;

  const ContractItemEntity({
    required this.id,
    required this.vehicleName,
    required this.clientName,
    required this.clientId,
    this.status,
    this.vehicleImage,
    this.contractType,
    this.totalServiceFee,
    this.serviceContractPdf,
    this.productName,
    this.collectorFirstName,
    this.collectorLastName,
    this.totalPrice,
    this.initialPayment,
    this.installmentAmount,
    this.installmentPeriodMonths,
    this.interestRate,
    this.totalInterest,
    this.monthlyPayment,
    this.productPrice,
    this.userFirstName,
    this.userLastName,
    this.approvedByAdminFirstName,
    this.approvedByAdminLastName,
    this.productImageUrls,
  });

  @override
  List<Object?> get props => [
        id,
        vehicleName,
        clientName,
        clientId,
        status,
        vehicleImage,
        contractType,
        totalServiceFee,
        serviceContractPdf,
        productName,
        collectorFirstName,
        collectorLastName,
        totalPrice,
        initialPayment,
        installmentAmount,
        installmentPeriodMonths,
        interestRate,
        totalInterest,
        monthlyPayment,
        productPrice,
        userFirstName,
        userLastName,
        approvedByAdminFirstName,
        approvedByAdminLastName,
        productImageUrls,
      ];
}
