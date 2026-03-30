import 'package:equatable/equatable.dart';

class UserBalanceEntity extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String role;
  final double balance;
  final double totalDebt;
  final double totalPaid;
  final double totalInvestment;
  final double totalPayable;
  final double pendingCollections;

  const UserBalanceEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
    required this.balance,
    required this.totalDebt,
    required this.totalPaid,
    required this.totalInvestment,
    required this.totalPayable,
    required this.pendingCollections,
  });

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        phoneNumber,
        role,
        balance,
        totalDebt,
        totalPaid,
        totalInvestment,
        totalPayable,
        pendingCollections,
      ];
}
