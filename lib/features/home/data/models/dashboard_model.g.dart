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

_DashboardDataModel _$DashboardDataModelFromJson(Map<String, dynamic> json) =>
    _DashboardDataModel(
      totalContractAmount: (json['total_contract_amount'] as num).toDouble(),
      totalPaid: (json['total_paid'] as num).toDouble(),
      totalRemaining: (json['total_remaining'] as num).toDouble(),
      nextPaymentAmount: (json['next_payment_amount'] as num).toDouble(),
      nextPaymentDate: json['next_payment_date'] as String,
      activeContracts: (json['active_contracts'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardDataModelToJson(_DashboardDataModel instance) =>
    <String, dynamic>{
      'total_contract_amount': instance.totalContractAmount,
      'total_paid': instance.totalPaid,
      'total_remaining': instance.totalRemaining,
      'next_payment_amount': instance.nextPaymentAmount,
      'next_payment_date': instance.nextPaymentDate,
      'active_contracts': instance.activeContracts,
    };
