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
    );

Map<String, dynamic> _$PaymentsModelToJson(_PaymentsModel instance) =>
    <String, dynamic>{
      'next_payments': instance.nextPayments,
      'paid_payments': instance.paidPayments,
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
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      serviceContractPdf: json['service_contract_pdf'] as String?,
    );

Map<String, dynamic> _$ContractModelToJson(_ContractModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'service_contract_pdf': instance.serviceContractPdf,
    };

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      name: json['name'] as String? ?? '',
      customFields: json['custom_fields'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'custom_fields': instance.customFields,
    };
