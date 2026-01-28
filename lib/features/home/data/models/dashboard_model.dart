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
    @JsonKey(name: 'total_contract_amount') @Default(0.0) double totalContractAmount,
    @JsonKey(name: 'total_paid') @Default(0.0) double totalPaid,
    @JsonKey(name: 'total_remaining') @Default(0.0) double totalRemaining,
    @JsonKey(name: 'next_payment_amount') @Default(0.0) double nextPaymentAmount,
    @JsonKey(name: 'next_payment_date') @Default('') String nextPaymentDate,
    @JsonKey(name: 'active_contracts') @Default(0) int activeContracts,
  }) = _DashboardDataModel;

  const DashboardDataModel._();

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) {
    return DashboardDataModel(
      totalContractAmount: (json['total_contract_amount'] as num?)?.toDouble() ?? 0.0,
      totalPaid: (json['total_paid'] as num?)?.toDouble() ?? 0.0,
      totalRemaining: (json['total_remaining'] as num?)?.toDouble() ?? 0.0,
      nextPaymentAmount: (json['next_payment_amount'] as num?)?.toDouble() ?? 0.0,
      nextPaymentDate: json['next_payment_date'] as String? ?? '',
      activeContracts: (json['active_contracts'] as num?)?.toInt() ?? 0,
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
