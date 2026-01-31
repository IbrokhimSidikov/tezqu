// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardModel {

 String get role; DashboardDataModel get data;
/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardModelCopyWith<DashboardModel> get copyWith => _$DashboardModelCopyWithImpl<DashboardModel>(this as DashboardModel, _$identity);

  /// Serializes this DashboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardModel&&(identical(other.role, role) || other.role == role)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,data);

@override
String toString() {
  return 'DashboardModel(role: $role, data: $data)';
}


}

/// @nodoc
abstract mixin class $DashboardModelCopyWith<$Res>  {
  factory $DashboardModelCopyWith(DashboardModel value, $Res Function(DashboardModel) _then) = _$DashboardModelCopyWithImpl;
@useResult
$Res call({
 String role, DashboardDataModel data
});


$DashboardDataModelCopyWith<$Res> get data;

}
/// @nodoc
class _$DashboardModelCopyWithImpl<$Res>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._self, this._then);

  final DashboardModel _self;
  final $Res Function(DashboardModel) _then;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? data = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardDataModel,
  ));
}
/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardDataModelCopyWith<$Res> get data {
  
  return $DashboardDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardModel].
extension DashboardModelPatterns on DashboardModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  DashboardDataModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that.role,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  DashboardDataModel data)  $default,) {final _that = this;
switch (_that) {
case _DashboardModel():
return $default(_that.role,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  DashboardDataModel data)?  $default,) {final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that.role,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardModel extends DashboardModel {
  const _DashboardModel({this.role = 'customer', required this.data}): super._();
  factory _DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);

@override@JsonKey() final  String role;
@override final  DashboardDataModel data;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardModelCopyWith<_DashboardModel> get copyWith => __$DashboardModelCopyWithImpl<_DashboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardModel&&(identical(other.role, role) || other.role == role)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,data);

@override
String toString() {
  return 'DashboardModel(role: $role, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DashboardModelCopyWith<$Res> implements $DashboardModelCopyWith<$Res> {
  factory _$DashboardModelCopyWith(_DashboardModel value, $Res Function(_DashboardModel) _then) = __$DashboardModelCopyWithImpl;
@override @useResult
$Res call({
 String role, DashboardDataModel data
});


@override $DashboardDataModelCopyWith<$Res> get data;

}
/// @nodoc
class __$DashboardModelCopyWithImpl<$Res>
    implements _$DashboardModelCopyWith<$Res> {
  __$DashboardModelCopyWithImpl(this._self, this._then);

  final _DashboardModel _self;
  final $Res Function(_DashboardModel) _then;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? data = null,}) {
  return _then(_DashboardModel(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardDataModel,
  ));
}

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardDataModelCopyWith<$Res> get data {
  
  return $DashboardDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DashboardDataModel {

// Customer fields
@JsonKey(name: 'total_contract_amount') double? get totalContractAmount;@JsonKey(name: 'total_paid') double? get totalPaid;@JsonKey(name: 'total_remaining') double? get totalRemaining;@JsonKey(name: 'next_payment_amount') double? get nextPaymentAmount;@JsonKey(name: 'next_payment_date') String? get nextPaymentDate;@JsonKey(name: 'active_contracts') int? get activeContracts;// Admin fields
@JsonKey(name: 'total_payments_this_month') double? get totalPaymentsThisMonth;@JsonKey(name: 'total_income_this_month') double? get totalIncomeThisMonth;@JsonKey(name: 'total_expenses_this_month') double? get totalExpensesThisMonth;@JsonKey(name: 'total_products_qty') int? get totalProductsQty;@JsonKey(name: 'net_profit_this_month') double? get netProfitThisMonth;@JsonKey(name: 'active_contracts_count') int? get activeContractsCount;@JsonKey(name: 'pending_payments_count') int? get pendingPaymentsCount;
/// Create a copy of DashboardDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDataModelCopyWith<DashboardDataModel> get copyWith => _$DashboardDataModelCopyWithImpl<DashboardDataModel>(this as DashboardDataModel, _$identity);

  /// Serializes this DashboardDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardDataModel&&(identical(other.totalContractAmount, totalContractAmount) || other.totalContractAmount == totalContractAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalRemaining, totalRemaining) || other.totalRemaining == totalRemaining)&&(identical(other.nextPaymentAmount, nextPaymentAmount) || other.nextPaymentAmount == nextPaymentAmount)&&(identical(other.nextPaymentDate, nextPaymentDate) || other.nextPaymentDate == nextPaymentDate)&&(identical(other.activeContracts, activeContracts) || other.activeContracts == activeContracts)&&(identical(other.totalPaymentsThisMonth, totalPaymentsThisMonth) || other.totalPaymentsThisMonth == totalPaymentsThisMonth)&&(identical(other.totalIncomeThisMonth, totalIncomeThisMonth) || other.totalIncomeThisMonth == totalIncomeThisMonth)&&(identical(other.totalExpensesThisMonth, totalExpensesThisMonth) || other.totalExpensesThisMonth == totalExpensesThisMonth)&&(identical(other.totalProductsQty, totalProductsQty) || other.totalProductsQty == totalProductsQty)&&(identical(other.netProfitThisMonth, netProfitThisMonth) || other.netProfitThisMonth == netProfitThisMonth)&&(identical(other.activeContractsCount, activeContractsCount) || other.activeContractsCount == activeContractsCount)&&(identical(other.pendingPaymentsCount, pendingPaymentsCount) || other.pendingPaymentsCount == pendingPaymentsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalContractAmount,totalPaid,totalRemaining,nextPaymentAmount,nextPaymentDate,activeContracts,totalPaymentsThisMonth,totalIncomeThisMonth,totalExpensesThisMonth,totalProductsQty,netProfitThisMonth,activeContractsCount,pendingPaymentsCount);

@override
String toString() {
  return 'DashboardDataModel(totalContractAmount: $totalContractAmount, totalPaid: $totalPaid, totalRemaining: $totalRemaining, nextPaymentAmount: $nextPaymentAmount, nextPaymentDate: $nextPaymentDate, activeContracts: $activeContracts, totalPaymentsThisMonth: $totalPaymentsThisMonth, totalIncomeThisMonth: $totalIncomeThisMonth, totalExpensesThisMonth: $totalExpensesThisMonth, totalProductsQty: $totalProductsQty, netProfitThisMonth: $netProfitThisMonth, activeContractsCount: $activeContractsCount, pendingPaymentsCount: $pendingPaymentsCount)';
}


}

/// @nodoc
abstract mixin class $DashboardDataModelCopyWith<$Res>  {
  factory $DashboardDataModelCopyWith(DashboardDataModel value, $Res Function(DashboardDataModel) _then) = _$DashboardDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_contract_amount') double? totalContractAmount,@JsonKey(name: 'total_paid') double? totalPaid,@JsonKey(name: 'total_remaining') double? totalRemaining,@JsonKey(name: 'next_payment_amount') double? nextPaymentAmount,@JsonKey(name: 'next_payment_date') String? nextPaymentDate,@JsonKey(name: 'active_contracts') int? activeContracts,@JsonKey(name: 'total_payments_this_month') double? totalPaymentsThisMonth,@JsonKey(name: 'total_income_this_month') double? totalIncomeThisMonth,@JsonKey(name: 'total_expenses_this_month') double? totalExpensesThisMonth,@JsonKey(name: 'total_products_qty') int? totalProductsQty,@JsonKey(name: 'net_profit_this_month') double? netProfitThisMonth,@JsonKey(name: 'active_contracts_count') int? activeContractsCount,@JsonKey(name: 'pending_payments_count') int? pendingPaymentsCount
});




}
/// @nodoc
class _$DashboardDataModelCopyWithImpl<$Res>
    implements $DashboardDataModelCopyWith<$Res> {
  _$DashboardDataModelCopyWithImpl(this._self, this._then);

  final DashboardDataModel _self;
  final $Res Function(DashboardDataModel) _then;

/// Create a copy of DashboardDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalContractAmount = freezed,Object? totalPaid = freezed,Object? totalRemaining = freezed,Object? nextPaymentAmount = freezed,Object? nextPaymentDate = freezed,Object? activeContracts = freezed,Object? totalPaymentsThisMonth = freezed,Object? totalIncomeThisMonth = freezed,Object? totalExpensesThisMonth = freezed,Object? totalProductsQty = freezed,Object? netProfitThisMonth = freezed,Object? activeContractsCount = freezed,Object? pendingPaymentsCount = freezed,}) {
  return _then(_self.copyWith(
totalContractAmount: freezed == totalContractAmount ? _self.totalContractAmount : totalContractAmount // ignore: cast_nullable_to_non_nullable
as double?,totalPaid: freezed == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double?,totalRemaining: freezed == totalRemaining ? _self.totalRemaining : totalRemaining // ignore: cast_nullable_to_non_nullable
as double?,nextPaymentAmount: freezed == nextPaymentAmount ? _self.nextPaymentAmount : nextPaymentAmount // ignore: cast_nullable_to_non_nullable
as double?,nextPaymentDate: freezed == nextPaymentDate ? _self.nextPaymentDate : nextPaymentDate // ignore: cast_nullable_to_non_nullable
as String?,activeContracts: freezed == activeContracts ? _self.activeContracts : activeContracts // ignore: cast_nullable_to_non_nullable
as int?,totalPaymentsThisMonth: freezed == totalPaymentsThisMonth ? _self.totalPaymentsThisMonth : totalPaymentsThisMonth // ignore: cast_nullable_to_non_nullable
as double?,totalIncomeThisMonth: freezed == totalIncomeThisMonth ? _self.totalIncomeThisMonth : totalIncomeThisMonth // ignore: cast_nullable_to_non_nullable
as double?,totalExpensesThisMonth: freezed == totalExpensesThisMonth ? _self.totalExpensesThisMonth : totalExpensesThisMonth // ignore: cast_nullable_to_non_nullable
as double?,totalProductsQty: freezed == totalProductsQty ? _self.totalProductsQty : totalProductsQty // ignore: cast_nullable_to_non_nullable
as int?,netProfitThisMonth: freezed == netProfitThisMonth ? _self.netProfitThisMonth : netProfitThisMonth // ignore: cast_nullable_to_non_nullable
as double?,activeContractsCount: freezed == activeContractsCount ? _self.activeContractsCount : activeContractsCount // ignore: cast_nullable_to_non_nullable
as int?,pendingPaymentsCount: freezed == pendingPaymentsCount ? _self.pendingPaymentsCount : pendingPaymentsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardDataModel].
extension DashboardDataModelPatterns on DashboardDataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardDataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardDataModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardDataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardDataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_contract_amount')  double? totalContractAmount, @JsonKey(name: 'total_paid')  double? totalPaid, @JsonKey(name: 'total_remaining')  double? totalRemaining, @JsonKey(name: 'next_payment_amount')  double? nextPaymentAmount, @JsonKey(name: 'next_payment_date')  String? nextPaymentDate, @JsonKey(name: 'active_contracts')  int? activeContracts, @JsonKey(name: 'total_payments_this_month')  double? totalPaymentsThisMonth, @JsonKey(name: 'total_income_this_month')  double? totalIncomeThisMonth, @JsonKey(name: 'total_expenses_this_month')  double? totalExpensesThisMonth, @JsonKey(name: 'total_products_qty')  int? totalProductsQty, @JsonKey(name: 'net_profit_this_month')  double? netProfitThisMonth, @JsonKey(name: 'active_contracts_count')  int? activeContractsCount, @JsonKey(name: 'pending_payments_count')  int? pendingPaymentsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardDataModel() when $default != null:
return $default(_that.totalContractAmount,_that.totalPaid,_that.totalRemaining,_that.nextPaymentAmount,_that.nextPaymentDate,_that.activeContracts,_that.totalPaymentsThisMonth,_that.totalIncomeThisMonth,_that.totalExpensesThisMonth,_that.totalProductsQty,_that.netProfitThisMonth,_that.activeContractsCount,_that.pendingPaymentsCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_contract_amount')  double? totalContractAmount, @JsonKey(name: 'total_paid')  double? totalPaid, @JsonKey(name: 'total_remaining')  double? totalRemaining, @JsonKey(name: 'next_payment_amount')  double? nextPaymentAmount, @JsonKey(name: 'next_payment_date')  String? nextPaymentDate, @JsonKey(name: 'active_contracts')  int? activeContracts, @JsonKey(name: 'total_payments_this_month')  double? totalPaymentsThisMonth, @JsonKey(name: 'total_income_this_month')  double? totalIncomeThisMonth, @JsonKey(name: 'total_expenses_this_month')  double? totalExpensesThisMonth, @JsonKey(name: 'total_products_qty')  int? totalProductsQty, @JsonKey(name: 'net_profit_this_month')  double? netProfitThisMonth, @JsonKey(name: 'active_contracts_count')  int? activeContractsCount, @JsonKey(name: 'pending_payments_count')  int? pendingPaymentsCount)  $default,) {final _that = this;
switch (_that) {
case _DashboardDataModel():
return $default(_that.totalContractAmount,_that.totalPaid,_that.totalRemaining,_that.nextPaymentAmount,_that.nextPaymentDate,_that.activeContracts,_that.totalPaymentsThisMonth,_that.totalIncomeThisMonth,_that.totalExpensesThisMonth,_that.totalProductsQty,_that.netProfitThisMonth,_that.activeContractsCount,_that.pendingPaymentsCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_contract_amount')  double? totalContractAmount, @JsonKey(name: 'total_paid')  double? totalPaid, @JsonKey(name: 'total_remaining')  double? totalRemaining, @JsonKey(name: 'next_payment_amount')  double? nextPaymentAmount, @JsonKey(name: 'next_payment_date')  String? nextPaymentDate, @JsonKey(name: 'active_contracts')  int? activeContracts, @JsonKey(name: 'total_payments_this_month')  double? totalPaymentsThisMonth, @JsonKey(name: 'total_income_this_month')  double? totalIncomeThisMonth, @JsonKey(name: 'total_expenses_this_month')  double? totalExpensesThisMonth, @JsonKey(name: 'total_products_qty')  int? totalProductsQty, @JsonKey(name: 'net_profit_this_month')  double? netProfitThisMonth, @JsonKey(name: 'active_contracts_count')  int? activeContractsCount, @JsonKey(name: 'pending_payments_count')  int? pendingPaymentsCount)?  $default,) {final _that = this;
switch (_that) {
case _DashboardDataModel() when $default != null:
return $default(_that.totalContractAmount,_that.totalPaid,_that.totalRemaining,_that.nextPaymentAmount,_that.nextPaymentDate,_that.activeContracts,_that.totalPaymentsThisMonth,_that.totalIncomeThisMonth,_that.totalExpensesThisMonth,_that.totalProductsQty,_that.netProfitThisMonth,_that.activeContractsCount,_that.pendingPaymentsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardDataModel extends DashboardDataModel {
  const _DashboardDataModel({@JsonKey(name: 'total_contract_amount') this.totalContractAmount, @JsonKey(name: 'total_paid') this.totalPaid, @JsonKey(name: 'total_remaining') this.totalRemaining, @JsonKey(name: 'next_payment_amount') this.nextPaymentAmount, @JsonKey(name: 'next_payment_date') this.nextPaymentDate, @JsonKey(name: 'active_contracts') this.activeContracts, @JsonKey(name: 'total_payments_this_month') this.totalPaymentsThisMonth, @JsonKey(name: 'total_income_this_month') this.totalIncomeThisMonth, @JsonKey(name: 'total_expenses_this_month') this.totalExpensesThisMonth, @JsonKey(name: 'total_products_qty') this.totalProductsQty, @JsonKey(name: 'net_profit_this_month') this.netProfitThisMonth, @JsonKey(name: 'active_contracts_count') this.activeContractsCount, @JsonKey(name: 'pending_payments_count') this.pendingPaymentsCount}): super._();
  factory _DashboardDataModel.fromJson(Map<String, dynamic> json) => _$DashboardDataModelFromJson(json);

// Customer fields
@override@JsonKey(name: 'total_contract_amount') final  double? totalContractAmount;
@override@JsonKey(name: 'total_paid') final  double? totalPaid;
@override@JsonKey(name: 'total_remaining') final  double? totalRemaining;
@override@JsonKey(name: 'next_payment_amount') final  double? nextPaymentAmount;
@override@JsonKey(name: 'next_payment_date') final  String? nextPaymentDate;
@override@JsonKey(name: 'active_contracts') final  int? activeContracts;
// Admin fields
@override@JsonKey(name: 'total_payments_this_month') final  double? totalPaymentsThisMonth;
@override@JsonKey(name: 'total_income_this_month') final  double? totalIncomeThisMonth;
@override@JsonKey(name: 'total_expenses_this_month') final  double? totalExpensesThisMonth;
@override@JsonKey(name: 'total_products_qty') final  int? totalProductsQty;
@override@JsonKey(name: 'net_profit_this_month') final  double? netProfitThisMonth;
@override@JsonKey(name: 'active_contracts_count') final  int? activeContractsCount;
@override@JsonKey(name: 'pending_payments_count') final  int? pendingPaymentsCount;

/// Create a copy of DashboardDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDataModelCopyWith<_DashboardDataModel> get copyWith => __$DashboardDataModelCopyWithImpl<_DashboardDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardDataModel&&(identical(other.totalContractAmount, totalContractAmount) || other.totalContractAmount == totalContractAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalRemaining, totalRemaining) || other.totalRemaining == totalRemaining)&&(identical(other.nextPaymentAmount, nextPaymentAmount) || other.nextPaymentAmount == nextPaymentAmount)&&(identical(other.nextPaymentDate, nextPaymentDate) || other.nextPaymentDate == nextPaymentDate)&&(identical(other.activeContracts, activeContracts) || other.activeContracts == activeContracts)&&(identical(other.totalPaymentsThisMonth, totalPaymentsThisMonth) || other.totalPaymentsThisMonth == totalPaymentsThisMonth)&&(identical(other.totalIncomeThisMonth, totalIncomeThisMonth) || other.totalIncomeThisMonth == totalIncomeThisMonth)&&(identical(other.totalExpensesThisMonth, totalExpensesThisMonth) || other.totalExpensesThisMonth == totalExpensesThisMonth)&&(identical(other.totalProductsQty, totalProductsQty) || other.totalProductsQty == totalProductsQty)&&(identical(other.netProfitThisMonth, netProfitThisMonth) || other.netProfitThisMonth == netProfitThisMonth)&&(identical(other.activeContractsCount, activeContractsCount) || other.activeContractsCount == activeContractsCount)&&(identical(other.pendingPaymentsCount, pendingPaymentsCount) || other.pendingPaymentsCount == pendingPaymentsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalContractAmount,totalPaid,totalRemaining,nextPaymentAmount,nextPaymentDate,activeContracts,totalPaymentsThisMonth,totalIncomeThisMonth,totalExpensesThisMonth,totalProductsQty,netProfitThisMonth,activeContractsCount,pendingPaymentsCount);

@override
String toString() {
  return 'DashboardDataModel(totalContractAmount: $totalContractAmount, totalPaid: $totalPaid, totalRemaining: $totalRemaining, nextPaymentAmount: $nextPaymentAmount, nextPaymentDate: $nextPaymentDate, activeContracts: $activeContracts, totalPaymentsThisMonth: $totalPaymentsThisMonth, totalIncomeThisMonth: $totalIncomeThisMonth, totalExpensesThisMonth: $totalExpensesThisMonth, totalProductsQty: $totalProductsQty, netProfitThisMonth: $netProfitThisMonth, activeContractsCount: $activeContractsCount, pendingPaymentsCount: $pendingPaymentsCount)';
}


}

/// @nodoc
abstract mixin class _$DashboardDataModelCopyWith<$Res> implements $DashboardDataModelCopyWith<$Res> {
  factory _$DashboardDataModelCopyWith(_DashboardDataModel value, $Res Function(_DashboardDataModel) _then) = __$DashboardDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_contract_amount') double? totalContractAmount,@JsonKey(name: 'total_paid') double? totalPaid,@JsonKey(name: 'total_remaining') double? totalRemaining,@JsonKey(name: 'next_payment_amount') double? nextPaymentAmount,@JsonKey(name: 'next_payment_date') String? nextPaymentDate,@JsonKey(name: 'active_contracts') int? activeContracts,@JsonKey(name: 'total_payments_this_month') double? totalPaymentsThisMonth,@JsonKey(name: 'total_income_this_month') double? totalIncomeThisMonth,@JsonKey(name: 'total_expenses_this_month') double? totalExpensesThisMonth,@JsonKey(name: 'total_products_qty') int? totalProductsQty,@JsonKey(name: 'net_profit_this_month') double? netProfitThisMonth,@JsonKey(name: 'active_contracts_count') int? activeContractsCount,@JsonKey(name: 'pending_payments_count') int? pendingPaymentsCount
});




}
/// @nodoc
class __$DashboardDataModelCopyWithImpl<$Res>
    implements _$DashboardDataModelCopyWith<$Res> {
  __$DashboardDataModelCopyWithImpl(this._self, this._then);

  final _DashboardDataModel _self;
  final $Res Function(_DashboardDataModel) _then;

/// Create a copy of DashboardDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalContractAmount = freezed,Object? totalPaid = freezed,Object? totalRemaining = freezed,Object? nextPaymentAmount = freezed,Object? nextPaymentDate = freezed,Object? activeContracts = freezed,Object? totalPaymentsThisMonth = freezed,Object? totalIncomeThisMonth = freezed,Object? totalExpensesThisMonth = freezed,Object? totalProductsQty = freezed,Object? netProfitThisMonth = freezed,Object? activeContractsCount = freezed,Object? pendingPaymentsCount = freezed,}) {
  return _then(_DashboardDataModel(
totalContractAmount: freezed == totalContractAmount ? _self.totalContractAmount : totalContractAmount // ignore: cast_nullable_to_non_nullable
as double?,totalPaid: freezed == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double?,totalRemaining: freezed == totalRemaining ? _self.totalRemaining : totalRemaining // ignore: cast_nullable_to_non_nullable
as double?,nextPaymentAmount: freezed == nextPaymentAmount ? _self.nextPaymentAmount : nextPaymentAmount // ignore: cast_nullable_to_non_nullable
as double?,nextPaymentDate: freezed == nextPaymentDate ? _self.nextPaymentDate : nextPaymentDate // ignore: cast_nullable_to_non_nullable
as String?,activeContracts: freezed == activeContracts ? _self.activeContracts : activeContracts // ignore: cast_nullable_to_non_nullable
as int?,totalPaymentsThisMonth: freezed == totalPaymentsThisMonth ? _self.totalPaymentsThisMonth : totalPaymentsThisMonth // ignore: cast_nullable_to_non_nullable
as double?,totalIncomeThisMonth: freezed == totalIncomeThisMonth ? _self.totalIncomeThisMonth : totalIncomeThisMonth // ignore: cast_nullable_to_non_nullable
as double?,totalExpensesThisMonth: freezed == totalExpensesThisMonth ? _self.totalExpensesThisMonth : totalExpensesThisMonth // ignore: cast_nullable_to_non_nullable
as double?,totalProductsQty: freezed == totalProductsQty ? _self.totalProductsQty : totalProductsQty // ignore: cast_nullable_to_non_nullable
as int?,netProfitThisMonth: freezed == netProfitThisMonth ? _self.netProfitThisMonth : netProfitThisMonth // ignore: cast_nullable_to_non_nullable
as double?,activeContractsCount: freezed == activeContractsCount ? _self.activeContractsCount : activeContractsCount // ignore: cast_nullable_to_non_nullable
as int?,pendingPaymentsCount: freezed == pendingPaymentsCount ? _self.pendingPaymentsCount : pendingPaymentsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
