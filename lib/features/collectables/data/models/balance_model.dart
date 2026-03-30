import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/balance_entity.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

@freezed
class UserBalanceModel with _$UserBalanceModel {
  const factory UserBalanceModel({
    required UserBalanceUserModel user,
    required BalanceDetailsModel balance,
  }) = _UserBalanceModel;

  const UserBalanceModel._();

  factory UserBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceModelFromJson(json);

  UserBalanceEntity toEntity() {
    return UserBalanceEntity(
      userId: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      role: user.role,
      balance: balance.balance,
      totalDebt: balance.totalDebt,
      totalPaid: balance.totalPaid,
      totalInvestment: balance.totalInvestment,
      totalPayable: balance.totalPayable,
      pendingCollections: balance.pendingCollections,
    );
  }

  @override
  // TODO: implement balance
  BalanceDetailsModel get balance => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  UserBalanceUserModel get user => throw UnimplementedError();
}

@freezed
class UserBalanceUserModel with _$UserBalanceUserModel {
  const factory UserBalanceUserModel({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String role,
  }) = _UserBalanceUserModel;

  factory UserBalanceUserModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceUserModelFromJson(json);

  @override
  // TODO: implement firstName
  String get firstName => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement lastName
  String get lastName => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String get phoneNumber => throw UnimplementedError();

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
class BalanceDetailsModel with _$BalanceDetailsModel {
  const factory BalanceDetailsModel({
    @JsonKey(fromJson: _toDouble) @Default(0.0) double balance,
    @JsonKey(name: 'total_debt', fromJson: _toDouble) @Default(0.0) double totalDebt,
    @JsonKey(name: 'total_paid', fromJson: _toDouble) @Default(0.0) double totalPaid,
    @JsonKey(name: 'total_investment', fromJson: _toDouble) @Default(0.0) double totalInvestment,
    @JsonKey(name: 'total_payable', fromJson: _toDouble) @Default(0.0) double totalPayable,
    @JsonKey(name: 'pending_collections', fromJson: _toDouble) @Default(0.0) double pendingCollections,
  }) = _BalanceDetailsModel;

  factory BalanceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceDetailsModelFromJson(json);

  @override
  // TODO: implement balance
  double get balance => throw UnimplementedError();

  @override
  // TODO: implement pendingCollections
  double get pendingCollections => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalDebt
  double get totalDebt => throw UnimplementedError();

  @override
  // TODO: implement totalInvestment
  double get totalInvestment => throw UnimplementedError();

  @override
  // TODO: implement totalPaid
  double get totalPaid => throw UnimplementedError();

  @override
  // TODO: implement totalPayable
  double get totalPayable => throw UnimplementedError();
}

double _toDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    if (value.isEmpty) return 0.0;
    return double.tryParse(value) ?? 0.0;
  }
  if (value == null) return 0.0;
  return 0.0;
}
