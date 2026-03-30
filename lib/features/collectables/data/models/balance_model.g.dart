// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBalanceModel _$UserBalanceModelFromJson(Map<String, dynamic> json) =>
    _UserBalanceModel(
      user: UserBalanceUserModel.fromJson(json['user'] as Map<String, dynamic>),
      balance: BalanceDetailsModel.fromJson(
        json['balance'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UserBalanceModelToJson(_UserBalanceModel instance) =>
    <String, dynamic>{'user': instance.user, 'balance': instance.balance};

_UserBalanceUserModel _$UserBalanceUserModelFromJson(
  Map<String, dynamic> json,
) => _UserBalanceUserModel(
  id: json['id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phoneNumber: json['phone_number'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserBalanceUserModelToJson(
  _UserBalanceUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'role': instance.role,
};

_BalanceDetailsModel _$BalanceDetailsModelFromJson(
  Map<String, dynamic> json,
) => _BalanceDetailsModel(
  balance: json['balance'] == null ? 0.0 : _toDouble(json['balance']),
  totalDebt: json['total_debt'] == null ? 0.0 : _toDouble(json['total_debt']),
  totalPaid: json['total_paid'] == null ? 0.0 : _toDouble(json['total_paid']),
  totalInvestment: json['total_investment'] == null
      ? 0.0
      : _toDouble(json['total_investment']),
  totalPayable: json['total_payable'] == null
      ? 0.0
      : _toDouble(json['total_payable']),
  pendingCollections: json['pending_collections'] == null
      ? 0.0
      : _toDouble(json['pending_collections']),
);

Map<String, dynamic> _$BalanceDetailsModelToJson(
  _BalanceDetailsModel instance,
) => <String, dynamic>{
  'balance': instance.balance,
  'total_debt': instance.totalDebt,
  'total_paid': instance.totalPaid,
  'total_investment': instance.totalInvestment,
  'total_payable': instance.totalPayable,
  'pending_collections': instance.pendingCollections,
};
