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
  final double totalContractAmount;
  final double totalPaid;
  final double totalRemaining;
  final double nextPaymentAmount;
  final String nextPaymentDate;
  final int activeContracts;
  
  // Admin fields
  final double totalPaymentsThisMonth;
  final double totalIncomeThisMonth;
  final double totalExpensesThisMonth;
  final int totalProductsQty;
  final double netProfitThisMonth;
  final int activeContractsCount;
  final int pendingPaymentsCount;

  const DashboardData({
    this.totalContractAmount = 0.0,
    this.totalPaid = 0.0,
    this.totalRemaining = 0.0,
    this.nextPaymentAmount = 0.0,
    this.nextPaymentDate = '',
    this.activeContracts = 0,
    this.totalPaymentsThisMonth = 0.0,
    this.totalIncomeThisMonth = 0.0,
    this.totalExpensesThisMonth = 0.0,
    this.totalProductsQty = 0,
    this.netProfitThisMonth = 0.0,
    this.activeContractsCount = 0,
    this.pendingPaymentsCount = 0,
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
