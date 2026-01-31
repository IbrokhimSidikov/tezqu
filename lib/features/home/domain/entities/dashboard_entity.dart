import 'package:equatable/equatable.dart';

class DashboardEntity extends Equatable {
  final String role;
  final DashboardData data;

  const DashboardEntity({
    required this.role,
    required this.data,
  });

  @override
  List<Object?> get props => [role, data];
}

class DashboardData extends Equatable {
  // Customer fields
  final double? totalContractAmount;
  final double? totalPaid;
  final double? totalRemaining;
  final double? nextPaymentAmount;
  final String? nextPaymentDate;
  final int? activeContracts;

  // Admin fields
  final double? totalPaymentsThisMonth;
  final double? totalIncomeThisMonth;
  final double? totalExpensesThisMonth;
  final int? totalProductsQty;
  final double? netProfitThisMonth;
  final int? activeContractsCount;
  final int? pendingPaymentsCount;

  const DashboardData({
    // Customer fields
    this.totalContractAmount,
    this.totalPaid,
    this.totalRemaining,
    this.nextPaymentAmount,
    this.nextPaymentDate,
    this.activeContracts,
    // Admin fields
    this.totalPaymentsThisMonth,
    this.totalIncomeThisMonth,
    this.totalExpensesThisMonth,
    this.totalProductsQty,
    this.netProfitThisMonth,
    this.activeContractsCount,
    this.pendingPaymentsCount,
  });

  @override
  List<Object?> get props => [
        totalContractAmount,
        totalPaid,
        totalRemaining,
        nextPaymentAmount,
        nextPaymentDate,
        activeContracts,
        totalPaymentsThisMonth,
        totalIncomeThisMonth,
        totalExpensesThisMonth,
        totalProductsQty,
        netProfitThisMonth,
        activeContractsCount,
        pendingPaymentsCount,
      ];
}
