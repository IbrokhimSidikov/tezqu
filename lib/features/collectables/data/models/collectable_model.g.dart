// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectableContractModel _$CollectableContractModelFromJson(
  Map<String, dynamic> json,
) => _CollectableContractModel(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  userId: json['user_id'] as String,
  approvedByAdmin: json['approved_by_admin'] as String?,
  contractType: json['contract_type'] as String,
  collectorId: json['collector_id'] as String?,
  paymentType: json['payment_type'] as String,
  payments:
      (json['payments'] as List<dynamic>?)
          ?.map(
            (e) => CollectablePaymentModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  user: json['user'] == null
      ? null
      : UserInfoModel.fromJson(json['user'] as Map<String, dynamic>),
  product: json['product'] == null
      ? null
      : ProductInfoModel.fromJson(json['product'] as Map<String, dynamic>),
  collector: json['collector'] == null
      ? null
      : CollectorInfoModel.fromJson(json['collector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CollectableContractModelToJson(
  _CollectableContractModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'user_id': instance.userId,
  'approved_by_admin': instance.approvedByAdmin,
  'contract_type': instance.contractType,
  'collector_id': instance.collectorId,
  'payment_type': instance.paymentType,
  'payments': instance.payments,
  'user': instance.user,
  'product': instance.product,
  'collector': instance.collector,
};

_CollectablePaymentModel _$CollectablePaymentModelFromJson(
  Map<String, dynamic> json,
) => _CollectablePaymentModel(
  id: json['id'] as String,
  contractId: json['contract_id'] as String,
  currencyId: json['currency_id'] as String,
  collectorId: json['collector_id'] as String?,
  paymentNumber: (json['payment_number'] as num).toInt(),
  dueDate: json['due_date'] as String,
  amount: _toDouble(json['amount']),
  amountPaid: _toDouble(json['amount_paid']),
  amountRemaining: _toDouble(json['amount_remaining']),
  status: json['status'] as String,
  paidDate: json['paid_date'] as String?,
  paymentMethodId: json['payment_method_id'] as String?,
  daysOverdue: (json['days_overdue'] as num?)?.toInt() ?? 0,
  reminderSent: json['reminder_sent'] as bool? ?? false,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$CollectablePaymentModelToJson(
  _CollectablePaymentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'contract_id': instance.contractId,
  'currency_id': instance.currencyId,
  'collector_id': instance.collectorId,
  'payment_number': instance.paymentNumber,
  'due_date': instance.dueDate,
  'amount': instance.amount,
  'amount_paid': instance.amountPaid,
  'amount_remaining': instance.amountRemaining,
  'status': instance.status,
  'paid_date': instance.paidDate,
  'payment_method_id': instance.paymentMethodId,
  'days_overdue': instance.daysOverdue,
  'reminder_sent': instance.reminderSent,
  'created_at': instance.createdAt,
};

_UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    _UserInfoModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(_UserInfoModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
    };

_ProductInfoModel _$ProductInfoModelFromJson(Map<String, dynamic> json) =>
    _ProductInfoModel(
      name: json['name'] as String?,
      category: json['category'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductInfoModelToJson(_ProductInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'image_urls': instance.imageUrls,
    };

_CollectorInfoModel _$CollectorInfoModelFromJson(Map<String, dynamic> json) =>
    _CollectorInfoModel(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$CollectorInfoModelToJson(_CollectorInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
    };
