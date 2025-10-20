// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    _DashboardModel(
      role: json['role'] as String,
      data: DashboardDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardModelToJson(_DashboardModel instance) =>
    <String, dynamic>{'role': instance.role, 'data': instance.data};

_DashboardDataModel _$DashboardDataModelFromJson(
  Map<String, dynamic> json,
) => _DashboardDataModel(
  totalPaymentsThisMonth:
      (json['total_payments_this_month'] as num?)?.toDouble() ?? 0,
  totalIncomeThisMonth:
      (json['total_income_this_month'] as num?)?.toDouble() ?? 0,
  totalExpensesThisMonth:
      (json['total_expenses_this_month'] as num?)?.toDouble() ?? 0,
  totalProductsQty: (json['total_products_qty'] as num?)?.toInt() ?? 0,
  netProfitThisMonth: (json['net_profit_this_month'] as num?)?.toDouble() ?? 0,
  activeContractsCount: (json['active_contracts_count'] as num?)?.toInt() ?? 0,
  pendingPaymentsCount: (json['pending_payments_count'] as num?)?.toInt() ?? 0,
  totalContractAmount: (json['total_contract_amount'] as num?)?.toDouble() ?? 0,
  totalPaid: (json['total_paid'] as num?)?.toDouble() ?? 0,
  totalRemaining: (json['total_remaining'] as num?)?.toDouble() ?? 0,
  nextPaymentAmount: (json['next_payment_amount'] as num?)?.toDouble() ?? 0,
  nextPaymentDate: json['next_payment_date'] as String? ?? '',
  activeContracts: (json['active_contracts'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DashboardDataModelToJson(_DashboardDataModel instance) =>
    <String, dynamic>{
      'total_payments_this_month': instance.totalPaymentsThisMonth,
      'total_income_this_month': instance.totalIncomeThisMonth,
      'total_expenses_this_month': instance.totalExpensesThisMonth,
      'total_products_qty': instance.totalProductsQty,
      'net_profit_this_month': instance.netProfitThisMonth,
      'active_contracts_count': instance.activeContractsCount,
      'pending_payments_count': instance.pendingPaymentsCount,
      'total_contract_amount': instance.totalContractAmount,
      'total_paid': instance.totalPaid,
      'total_remaining': instance.totalRemaining,
      'next_payment_amount': instance.nextPaymentAmount,
      'next_payment_date': instance.nextPaymentDate,
      'active_contracts': instance.activeContracts,
    };
