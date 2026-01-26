// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentsModel _$PaymentsModelFromJson(Map<String, dynamic> json) =>
    _PaymentsModel(
      nextPayments:
          (json['next_payments'] as List<dynamic>?)
              ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paidPayments:
          (json['paid_payments'] as List<dynamic>?)
              ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      summary: json['summary'] == null
          ? null
          : SummaryModel.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentsModelToJson(_PaymentsModel instance) =>
    <String, dynamic>{
      'next_payments': instance.nextPayments,
      'paid_payments': instance.paidPayments,
      'summary': instance.summary,
    };

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: _toInt(json['id']),
      productName: json['product_name'] as String? ?? '',
      dueDate: json['due_date'] as String? ?? '',
      amount: _toDouble(json['amount']),
      status: json['status'] as String? ?? '',
      contractId: _toInt(json['contract_id']),
      productImage: json['product_image'] as String?,
      productCategory: json['product_category'] as String?,
      contract: json['contract'] == null
          ? null
          : ContractModel.fromJson(json['contract'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'due_date': instance.dueDate,
      'amount': instance.amount,
      'status': instance.status,
      'contract_id': instance.contractId,
      'product_image': instance.productImage,
      'product_category': instance.productCategory,
      'contract': instance.contract,
    };

_ContractModel _$ContractModelFromJson(Map<String, dynamic> json) =>
    _ContractModel(
      id: _toInt(json['id']),
      productId: json['product_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      serviceContractPdf: json['service_contract_pdf'] as String?,
    );

Map<String, dynamic> _$ContractModelToJson(_ContractModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product': instance.product,
      'service_contract_pdf': instance.serviceContractPdf,
    };

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      customFields: json['custom_fields'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'custom_fields': instance.customFields,
    };

_SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) =>
    _SummaryModel(
      totalContracts: (json['total_contracts'] as num?)?.toInt() ?? 0,
      totalPayments: (json['total_payments'] as num?)?.toInt() ?? 0,
      paidCount: (json['paid_count'] as num?)?.toInt() ?? 0,
      remainingCount: (json['remaining_count'] as num?)?.toInt() ?? 0,
      totalPaid: (json['total_paid'] as num?)?.toDouble() ?? 0.0,
      totalRemaining: (json['total_remaining'] as num?)?.toDouble() ?? 0.0,
      completionPercentage:
          (json['completion_percentage'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SummaryModelToJson(_SummaryModel instance) =>
    <String, dynamic>{
      'total_contracts': instance.totalContracts,
      'total_payments': instance.totalPayments,
      'paid_count': instance.paidCount,
      'remaining_count': instance.remainingCount,
      'total_paid': instance.totalPaid,
      'total_remaining': instance.totalRemaining,
      'completion_percentage': instance.completionPercentage,
    };
