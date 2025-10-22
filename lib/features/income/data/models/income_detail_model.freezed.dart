// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeDetailModel {

@JsonKey(name: 'customer_name') String get customerName; List<PaymentDetailModel> get payments;
/// Create a copy of IncomeDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeDetailModelCopyWith<IncomeDetailModel> get copyWith => _$IncomeDetailModelCopyWithImpl<IncomeDetailModel>(this as IncomeDetailModel, _$identity);

  /// Serializes this IncomeDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeDetailModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&const DeepCollectionEquality().equals(other.payments, payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'IncomeDetailModel(customerName: $customerName, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $IncomeDetailModelCopyWith<$Res>  {
  factory $IncomeDetailModelCopyWith(IncomeDetailModel value, $Res Function(IncomeDetailModel) _then) = _$IncomeDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'customer_name') String customerName, List<PaymentDetailModel> payments
});




}
/// @nodoc
class _$IncomeDetailModelCopyWithImpl<$Res>
    implements $IncomeDetailModelCopyWith<$Res> {
  _$IncomeDetailModelCopyWithImpl(this._self, this._then);

  final IncomeDetailModel _self;
  final $Res Function(IncomeDetailModel) _then;

/// Create a copy of IncomeDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerName = null,Object? payments = null,}) {
  return _then(_self.copyWith(
customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentDetailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeDetailModel].
extension IncomeDetailModelPatterns on IncomeDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _IncomeDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_name')  String customerName,  List<PaymentDetailModel> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeDetailModel() when $default != null:
return $default(_that.customerName,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_name')  String customerName,  List<PaymentDetailModel> payments)  $default,) {final _that = this;
switch (_that) {
case _IncomeDetailModel():
return $default(_that.customerName,_that.payments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'customer_name')  String customerName,  List<PaymentDetailModel> payments)?  $default,) {final _that = this;
switch (_that) {
case _IncomeDetailModel() when $default != null:
return $default(_that.customerName,_that.payments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeDetailModel extends IncomeDetailModel {
  const _IncomeDetailModel({@JsonKey(name: 'customer_name') this.customerName = '', final  List<PaymentDetailModel> payments = const []}): _payments = payments,super._();
  factory _IncomeDetailModel.fromJson(Map<String, dynamic> json) => _$IncomeDetailModelFromJson(json);

@override@JsonKey(name: 'customer_name') final  String customerName;
 final  List<PaymentDetailModel> _payments;
@override@JsonKey() List<PaymentDetailModel> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}


/// Create a copy of IncomeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeDetailModelCopyWith<_IncomeDetailModel> get copyWith => __$IncomeDetailModelCopyWithImpl<_IncomeDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeDetailModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&const DeepCollectionEquality().equals(other._payments, _payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'IncomeDetailModel(customerName: $customerName, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$IncomeDetailModelCopyWith<$Res> implements $IncomeDetailModelCopyWith<$Res> {
  factory _$IncomeDetailModelCopyWith(_IncomeDetailModel value, $Res Function(_IncomeDetailModel) _then) = __$IncomeDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'customer_name') String customerName, List<PaymentDetailModel> payments
});




}
/// @nodoc
class __$IncomeDetailModelCopyWithImpl<$Res>
    implements _$IncomeDetailModelCopyWith<$Res> {
  __$IncomeDetailModelCopyWithImpl(this._self, this._then);

  final _IncomeDetailModel _self;
  final $Res Function(_IncomeDetailModel) _then;

/// Create a copy of IncomeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerName = null,Object? payments = null,}) {
  return _then(_IncomeDetailModel(
customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentDetailModel>,
  ));
}


}


/// @nodoc
mixin _$PaymentDetailModel {

 String get id;@JsonKey(name: 'contract_id') String get contractId;@JsonKey(name: 'customer_name') String get customerName;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'payment_number') int get paymentNumber;@JsonKey(name: 'due_date') String? get dueDate; double get amount;@JsonKey(name: 'amount_paid') double get amountPaid;@JsonKey(name: 'amount_remaining') double get amountRemaining; String get status;@JsonKey(name: 'currency_code') String get currencyCode;@JsonKey(name: 'currency_symbol') String get currencySymbol;
/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<PaymentDetailModel> get copyWith => _$PaymentDetailModelCopyWithImpl<PaymentDetailModel>(this as PaymentDetailModel, _$identity);

  /// Serializes this PaymentDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.paymentNumber, paymentNumber) || other.paymentNumber == paymentNumber)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contractId,customerName,productName,paymentNumber,dueDate,amount,amountPaid,amountRemaining,status,currencyCode,currencySymbol);

@override
String toString() {
  return 'PaymentDetailModel(id: $id, contractId: $contractId, customerName: $customerName, productName: $productName, paymentNumber: $paymentNumber, dueDate: $dueDate, amount: $amount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, status: $status, currencyCode: $currencyCode, currencySymbol: $currencySymbol)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailModelCopyWith<$Res>  {
  factory $PaymentDetailModelCopyWith(PaymentDetailModel value, $Res Function(PaymentDetailModel) _then) = _$PaymentDetailModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'contract_id') String contractId,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'payment_number') int paymentNumber,@JsonKey(name: 'due_date') String? dueDate, double amount,@JsonKey(name: 'amount_paid') double amountPaid,@JsonKey(name: 'amount_remaining') double amountRemaining, String status,@JsonKey(name: 'currency_code') String currencyCode,@JsonKey(name: 'currency_symbol') String currencySymbol
});




}
/// @nodoc
class _$PaymentDetailModelCopyWithImpl<$Res>
    implements $PaymentDetailModelCopyWith<$Res> {
  _$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final PaymentDetailModel _self;
  final $Res Function(PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? contractId = null,Object? customerName = null,Object? productName = null,Object? paymentNumber = null,Object? dueDate = freezed,Object? amount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? status = null,Object? currencyCode = null,Object? currencySymbol = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,paymentNumber: null == paymentNumber ? _self.paymentNumber : paymentNumber // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetailModel].
extension PaymentDetailModelPatterns on PaymentDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'contract_id')  String contractId, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'payment_number')  int paymentNumber, @JsonKey(name: 'due_date')  String? dueDate,  double amount, @JsonKey(name: 'amount_paid')  double amountPaid, @JsonKey(name: 'amount_remaining')  double amountRemaining,  String status, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'currency_symbol')  String currencySymbol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.id,_that.contractId,_that.customerName,_that.productName,_that.paymentNumber,_that.dueDate,_that.amount,_that.amountPaid,_that.amountRemaining,_that.status,_that.currencyCode,_that.currencySymbol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'contract_id')  String contractId, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'payment_number')  int paymentNumber, @JsonKey(name: 'due_date')  String? dueDate,  double amount, @JsonKey(name: 'amount_paid')  double amountPaid, @JsonKey(name: 'amount_remaining')  double amountRemaining,  String status, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'currency_symbol')  String currencySymbol)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel():
return $default(_that.id,_that.contractId,_that.customerName,_that.productName,_that.paymentNumber,_that.dueDate,_that.amount,_that.amountPaid,_that.amountRemaining,_that.status,_that.currencyCode,_that.currencySymbol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'contract_id')  String contractId, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'payment_number')  int paymentNumber, @JsonKey(name: 'due_date')  String? dueDate,  double amount, @JsonKey(name: 'amount_paid')  double amountPaid, @JsonKey(name: 'amount_remaining')  double amountRemaining,  String status, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'currency_symbol')  String currencySymbol)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.id,_that.contractId,_that.customerName,_that.productName,_that.paymentNumber,_that.dueDate,_that.amount,_that.amountPaid,_that.amountRemaining,_that.status,_that.currencyCode,_that.currencySymbol);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetailModel extends PaymentDetailModel {
  const _PaymentDetailModel({required this.id, @JsonKey(name: 'contract_id') required this.contractId, @JsonKey(name: 'customer_name') this.customerName = '', @JsonKey(name: 'product_name') this.productName = '', @JsonKey(name: 'payment_number') this.paymentNumber = 0, @JsonKey(name: 'due_date') this.dueDate, this.amount = 0.0, @JsonKey(name: 'amount_paid') this.amountPaid = 0.0, @JsonKey(name: 'amount_remaining') this.amountRemaining = 0.0, this.status = '', @JsonKey(name: 'currency_code') this.currencyCode = 'usd', @JsonKey(name: 'currency_symbol') this.currencySymbol = '\$'}): super._();
  factory _PaymentDetailModel.fromJson(Map<String, dynamic> json) => _$PaymentDetailModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'contract_id') final  String contractId;
@override@JsonKey(name: 'customer_name') final  String customerName;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'payment_number') final  int paymentNumber;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey() final  double amount;
@override@JsonKey(name: 'amount_paid') final  double amountPaid;
@override@JsonKey(name: 'amount_remaining') final  double amountRemaining;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'currency_code') final  String currencyCode;
@override@JsonKey(name: 'currency_symbol') final  String currencySymbol;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailModelCopyWith<_PaymentDetailModel> get copyWith => __$PaymentDetailModelCopyWithImpl<_PaymentDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.paymentNumber, paymentNumber) || other.paymentNumber == paymentNumber)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contractId,customerName,productName,paymentNumber,dueDate,amount,amountPaid,amountRemaining,status,currencyCode,currencySymbol);

@override
String toString() {
  return 'PaymentDetailModel(id: $id, contractId: $contractId, customerName: $customerName, productName: $productName, paymentNumber: $paymentNumber, dueDate: $dueDate, amount: $amount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, status: $status, currencyCode: $currencyCode, currencySymbol: $currencySymbol)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailModelCopyWith<$Res> implements $PaymentDetailModelCopyWith<$Res> {
  factory _$PaymentDetailModelCopyWith(_PaymentDetailModel value, $Res Function(_PaymentDetailModel) _then) = __$PaymentDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'contract_id') String contractId,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'payment_number') int paymentNumber,@JsonKey(name: 'due_date') String? dueDate, double amount,@JsonKey(name: 'amount_paid') double amountPaid,@JsonKey(name: 'amount_remaining') double amountRemaining, String status,@JsonKey(name: 'currency_code') String currencyCode,@JsonKey(name: 'currency_symbol') String currencySymbol
});




}
/// @nodoc
class __$PaymentDetailModelCopyWithImpl<$Res>
    implements _$PaymentDetailModelCopyWith<$Res> {
  __$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final _PaymentDetailModel _self;
  final $Res Function(_PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contractId = null,Object? customerName = null,Object? productName = null,Object? paymentNumber = null,Object? dueDate = freezed,Object? amount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? status = null,Object? currencyCode = null,Object? currencySymbol = null,}) {
  return _then(_PaymentDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,paymentNumber: null == paymentNumber ? _self.paymentNumber : paymentNumber // ignore: cast_nullable_to_non_nullable
as int,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
