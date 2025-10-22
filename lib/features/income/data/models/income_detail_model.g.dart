// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeDetailModel _$IncomeDetailModelFromJson(Map<String, dynamic> json) =>
    _IncomeDetailModel(
      customerName: json['customer_name'] as String? ?? '',
      payments:
          (json['payments'] as List<dynamic>?)
              ?.map(
                (e) => PaymentDetailModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$IncomeDetailModelToJson(_IncomeDetailModel instance) =>
    <String, dynamic>{
      'customer_name': instance.customerName,
      'payments': instance.payments,
    };

_PaymentDetailModel _$PaymentDetailModelFromJson(Map<String, dynamic> json) =>
    _PaymentDetailModel(
      id: json['id'] as String,
      contractId: json['contract_id'] as String,
      customerName: json['customer_name'] as String? ?? '',
      productName: json['product_name'] as String? ?? '',
      paymentNumber: (json['payment_number'] as num?)?.toInt() ?? 0,
      dueDate: json['due_date'] as String?,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      amountPaid: (json['amount_paid'] as num?)?.toDouble() ?? 0.0,
      amountRemaining: (json['amount_remaining'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
      currencyCode: json['currency_code'] as String? ?? 'usd',
      currencySymbol: json['currency_symbol'] as String? ?? '\$',
    );

Map<String, dynamic> _$PaymentDetailModelToJson(_PaymentDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contract_id': instance.contractId,
      'customer_name': instance.customerName,
      'product_name': instance.productName,
      'payment_number': instance.paymentNumber,
      'due_date': instance.dueDate,
      'amount': instance.amount,
      'amount_paid': instance.amountPaid,
      'amount_remaining': instance.amountRemaining,
      'status': instance.status,
      'currency_code': instance.currencyCode,
      'currency_symbol': instance.currencySymbol,
    };
