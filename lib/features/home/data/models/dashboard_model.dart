import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dashboard_entity.dart';

part 'dashboard_model.freezed.dart';
// part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    @Default('customer') String role,
    required DashboardDataModel data,
  }) = _DashboardModel;

  const DashboardModel._();

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      role: json['role'] as String? ?? 'customer',
      data: DashboardDataModel.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
    );
  }

  DashboardEntity toEntity() {
    return DashboardEntity(
      role: role,
      data: data.toEntity(),
    );
  }

  @override
  // TODO: implement data
  DashboardDataModel get data => throw UnimplementedError();

  @override
  // TODO: implement role
  String get role => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class DashboardDataModel with _$DashboardDataModel {
  const factory DashboardDataModel({
    // Customer fields
    @JsonKey(name: 'total_contract_amount') @Default(0.0) double totalContractAmount,
    @JsonKey(name: 'total_paid') @Default(0.0) double totalPaid,
    @JsonKey(name: 'total_remaining') @Default(0.0) double totalRemaining,
    @JsonKey(name: 'next_payment_amount') @Default(0.0) double nextPaymentAmount,
    @JsonKey(name: 'next_payment_date') @Default('') String nextPaymentDate,
    @JsonKey(name: 'active_contracts') @Default(0) int activeContracts,
    // Admin fields
    @JsonKey(name: 'total_payments_this_month') @Default(0.0) double totalPaymentsThisMonth,
    @JsonKey(name: 'total_income_this_month') @Default(0.0) double totalIncomeThisMonth,
    @JsonKey(name: 'total_expenses_this_month') @Default(0.0) double totalExpensesThisMonth,
    @JsonKey(name: 'total_products_qty') @Default(0) int totalProductsQty,
    @JsonKey(name: 'net_profit_this_month') @Default(0.0) double netProfitThisMonth,
    @JsonKey(name: 'active_contracts_count') @Default(0) int activeContractsCount,
    @JsonKey(name: 'pending_payments_count') @Default(0) int pendingPaymentsCount,
  }) = _DashboardDataModel;

  const DashboardDataModel._();

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) {
    return DashboardDataModel(
      // Customer fields
      totalContractAmount: (json['total_contract_amount'] as num?)?.toDouble() ?? 0.0,
      totalPaid: (json['total_paid'] as num?)?.toDouble() ?? 0.0,
      totalRemaining: (json['total_remaining'] as num?)?.toDouble() ?? 0.0,
      nextPaymentAmount: (json['next_payment_amount'] as num?)?.toDouble() ?? 0.0,
      nextPaymentDate: json['next_payment_date'] as String? ?? '',
      activeContracts: (json['active_contracts'] as num?)?.toInt() ?? 0,
      // Admin fields
      totalPaymentsThisMonth: (json['total_payments_this_month'] as num?)?.toDouble() ?? 0.0,
      totalIncomeThisMonth: (json['total_income_this_month'] as num?)?.toDouble() ?? 0.0,
      totalExpensesThisMonth: (json['total_expenses_this_month'] as num?)?.toDouble() ?? 0.0,
      totalProductsQty: (json['total_products_qty'] as num?)?.toInt() ?? 0,
      netProfitThisMonth: (json['net_profit_this_month'] as num?)?.toDouble() ?? 0.0,
      activeContractsCount: (json['active_contracts_count'] as num?)?.toInt() ?? 0,
      pendingPaymentsCount: (json['pending_payments_count'] as num?)?.toInt() ?? 0,
    );
  }

  DashboardData toEntity() {
    return DashboardData(
      totalContractAmount: totalContractAmount,
      totalPaid: totalPaid,
      totalRemaining: totalRemaining,
      nextPaymentAmount: nextPaymentAmount,
      nextPaymentDate: nextPaymentDate,
      activeContracts: activeContracts,
      totalPaymentsThisMonth: totalPaymentsThisMonth,
      totalIncomeThisMonth: totalIncomeThisMonth,
      totalExpensesThisMonth: totalExpensesThisMonth,
      totalProductsQty: totalProductsQty,
      netProfitThisMonth: netProfitThisMonth,
      activeContractsCount: activeContractsCount,
      pendingPaymentsCount: pendingPaymentsCount,
    );
  }

  @override
  // TODO: implement activeContracts
  int get activeContracts => throw UnimplementedError();

  @override
  // TODO: implement nextPaymentAmount
  double get nextPaymentAmount => throw UnimplementedError();

  @override
  // TODO: implement nextPaymentDate
  String get nextPaymentDate => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalContractAmount
  double get totalContractAmount => throw UnimplementedError();

  @override
  // TODO: implement totalPaid
  double get totalPaid => throw UnimplementedError();

  @override
  // TODO: implement totalRemaining
  double get totalRemaining => throw UnimplementedError();

  @override
  // TODO: implement activeContractsCount
  int get activeContractsCount => throw UnimplementedError();

  @override
  // TODO: implement netProfitThisMonth
  double get netProfitThisMonth => throw UnimplementedError();

  @override
  // TODO: implement pendingPaymentsCount
  int get pendingPaymentsCount => throw UnimplementedError();

  @override
  // TODO: implement totalExpensesThisMonth
  double get totalExpensesThisMonth => throw UnimplementedError();

  @override
  // TODO: implement totalIncomeThisMonth
  double get totalIncomeThisMonth => throw UnimplementedError();

  @override
  // TODO: implement totalPaymentsThisMonth
  double get totalPaymentsThisMonth => throw UnimplementedError();

  @override
  // TODO: implement totalProductsQty
  int get totalProductsQty => throw UnimplementedError();
}
