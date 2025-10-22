// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeSourcesModel _$IncomeSourcesModelFromJson(
  Map<String, dynamic> json,
) => _IncomeSourcesModel(
  collectors:
      (json['collectors'] as List<dynamic>?)
          ?.map((e) => IncomeSourceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  customers:
      (json['customers'] as List<dynamic>?)
          ?.map((e) => IncomeSourceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  investors:
      (json['investors'] as List<dynamic>?)
          ?.map((e) => IncomeSourceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  month: json['month'] as String?,
);

Map<String, dynamic> _$IncomeSourcesModelToJson(_IncomeSourcesModel instance) =>
    <String, dynamic>{
      'collectors': instance.collectors,
      'customers': instance.customers,
      'investors': instance.investors,
      'month': instance.month,
    };

_IncomeSourceModel _$IncomeSourceModelFromJson(Map<String, dynamic> json) =>
    _IncomeSourceModel(
      sourceType: json['source_type'] as String?,
      userId: json['user_id'] as String?,
      fullName: json['full_name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String?,
      monthlyTotal: (json['monthly_total'] as num?)?.toDouble() ?? 0.0,
      pendingCount: (json['pending_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$IncomeSourceModelToJson(_IncomeSourceModel instance) =>
    <String, dynamic>{
      'source_type': instance.sourceType,
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'monthly_total': instance.monthlyTotal,
      'pending_count': instance.pendingCount,
    };
