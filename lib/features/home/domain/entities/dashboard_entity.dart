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
  final double totalContractAmount;
  final double totalPaid;
  final double totalRemaining;
  final double nextPaymentAmount;
  final String nextPaymentDate;
  final int activeContracts;

  const DashboardData({
    required this.totalContractAmount,
    required this.totalPaid,
    required this.totalRemaining,
    required this.nextPaymentAmount,
    required this.nextPaymentDate,
    required this.activeContracts,
  });

  @override
  List<Object?> get props => [
        totalContractAmount,
        totalPaid,
        totalRemaining,
        nextPaymentAmount,
        nextPaymentDate,
        activeContracts,
      ];
}
