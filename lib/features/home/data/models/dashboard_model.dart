import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dashboard_entity.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    @Default('customer') String role,
    required DashboardDataModel data,
  }) = _DashboardModel;

  const DashboardModel._();

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);

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
class ContractDataModel with _$ContractDataModel {
  const factory ContractDataModel({
    @JsonKey(name: 'total_contract_amount') @Default(0.0) double totalContractAmount,
    @JsonKey(name: 'total_paid') @Default(0.0) double totalPaid,
    @JsonKey(name: 'total_remaining') @Default(0.0) double totalRemaining,
    @JsonKey(name: 'next_payment_amount') @Default(0.0) double nextPaymentAmount,
    @JsonKey(name: 'next_payment_date') String? nextPaymentDate,
    @JsonKey(name: 'active_contracts') @Default(0) int activeContracts,
  }) = _ContractDataModel;

  const ContractDataModel._();

  factory ContractDataModel.fromJson(Map<String, dynamic> json) => _$ContractDataModelFromJson(json);

  ContractData toEntity() {
    return ContractData(
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
  String? get nextPaymentDate => throw UnimplementedError();

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
}

@freezed
class DashboardDataModel with _$DashboardDataModel {
  const factory DashboardDataModel({
    // New customer fields
    @JsonKey(name: 'sale_contracts') ContractDataModel? saleContracts,
    @JsonKey(name: 'purchase_contracts') ContractDataModel? purchaseContracts,
    // Legacy customer fields
    @JsonKey(name: 'total_contract_amount') double? totalContractAmount,
    @JsonKey(name: 'total_paid') double? totalPaid,
    @JsonKey(name: 'total_remaining') double? totalRemaining,
    @JsonKey(name: 'next_payment_amount') double? nextPaymentAmount,
    @JsonKey(name: 'next_payment_date') String? nextPaymentDate,
    @JsonKey(name: 'active_contracts') int? activeContracts,
    // Admin fields
    @JsonKey(name: 'total_payments_this_month') double? totalPaymentsThisMonth,
    @JsonKey(name: 'total_income_this_month') double? totalIncomeThisMonth,
    @JsonKey(name: 'total_expenses_this_month') double? totalExpensesThisMonth,
    @JsonKey(name: 'total_products_qty') int? totalProductsQty,
    @JsonKey(name: 'net_profit_this_month') double? netProfitThisMonth,
    @JsonKey(name: 'active_contracts_count') int? activeContractsCount,
    @JsonKey(name: 'pending_payments_count') int? pendingPaymentsCount,
  }) = _DashboardDataModel;

  const DashboardDataModel._();

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) => _$DashboardDataModelFromJson(json);

  DashboardData toEntity() {
    return DashboardData(
      // New customer fields
      saleContracts: saleContracts?.toEntity(),
      purchaseContracts: purchaseContracts?.toEntity(),
      // Legacy customer fields
      totalContractAmount: totalContractAmount,
      totalPaid: totalPaid,
      totalRemaining: totalRemaining,
      nextPaymentAmount: nextPaymentAmount,
      nextPaymentDate: nextPaymentDate,
      activeContracts: activeContracts,
      // Admin fields
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
  int? get activeContracts => throw UnimplementedError();

  @override
  // TODO: implement activeContractsCount
  int? get activeContractsCount => throw UnimplementedError();

  @override
  // TODO: implement netProfitThisMonth
  double? get netProfitThisMonth => throw UnimplementedError();

  @override
  // TODO: implement nextPaymentAmount
  double? get nextPaymentAmount => throw UnimplementedError();

  @override
  // TODO: implement nextPaymentDate
  String? get nextPaymentDate => throw UnimplementedError();

  @override
  // TODO: implement pendingPaymentsCount
  int? get pendingPaymentsCount => throw UnimplementedError();

  @override
  // TODO: implement purchaseContracts
  ContractDataModel? get purchaseContracts => throw UnimplementedError();

  @override
  // TODO: implement saleContracts
  ContractDataModel? get saleContracts => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalContractAmount
  double? get totalContractAmount => throw UnimplementedError();

  @override
  // TODO: implement totalExpensesThisMonth
  double? get totalExpensesThisMonth => throw UnimplementedError();

  @override
  // TODO: implement totalIncomeThisMonth
  double? get totalIncomeThisMonth => throw UnimplementedError();

  @override
  // TODO: implement totalPaid
  double? get totalPaid => throw UnimplementedError();

  @override
  // TODO: implement totalPaymentsThisMonth
  double? get totalPaymentsThisMonth => throw UnimplementedError();

  @override
  // TODO: implement totalProductsQty
  int? get totalProductsQty => throw UnimplementedError();

  @override
  // TODO: implement totalRemaining
  double? get totalRemaining => throw UnimplementedError();
}
