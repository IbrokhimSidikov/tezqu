// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentsModel {

@JsonKey(name: 'next_payments') List<PaymentModel> get nextPayments;@JsonKey(name: 'paid_payments') List<PaymentModel> get paidPayments;
/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentsModelCopyWith<PaymentsModel> get copyWith => _$PaymentsModelCopyWithImpl<PaymentsModel>(this as PaymentsModel, _$identity);

  /// Serializes this PaymentsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentsModel&&const DeepCollectionEquality().equals(other.nextPayments, nextPayments)&&const DeepCollectionEquality().equals(other.paidPayments, paidPayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nextPayments),const DeepCollectionEquality().hash(paidPayments));

@override
String toString() {
  return 'PaymentsModel(nextPayments: $nextPayments, paidPayments: $paidPayments)';
}


}

/// @nodoc
abstract mixin class $PaymentsModelCopyWith<$Res>  {
  factory $PaymentsModelCopyWith(PaymentsModel value, $Res Function(PaymentsModel) _then) = _$PaymentsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'next_payments') List<PaymentModel> nextPayments,@JsonKey(name: 'paid_payments') List<PaymentModel> paidPayments
});




}
/// @nodoc
class _$PaymentsModelCopyWithImpl<$Res>
    implements $PaymentsModelCopyWith<$Res> {
  _$PaymentsModelCopyWithImpl(this._self, this._then);

  final PaymentsModel _self;
  final $Res Function(PaymentsModel) _then;

/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextPayments = null,Object? paidPayments = null,}) {
  return _then(_self.copyWith(
nextPayments: null == nextPayments ? _self.nextPayments : nextPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,paidPayments: null == paidPayments ? _self.paidPayments : paidPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentsModel].
extension PaymentsModelPatterns on PaymentsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentsModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'next_payments')  List<PaymentModel> nextPayments, @JsonKey(name: 'paid_payments')  List<PaymentModel> paidPayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentsModel() when $default != null:
return $default(_that.nextPayments,_that.paidPayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'next_payments')  List<PaymentModel> nextPayments, @JsonKey(name: 'paid_payments')  List<PaymentModel> paidPayments)  $default,) {final _that = this;
switch (_that) {
case _PaymentsModel():
return $default(_that.nextPayments,_that.paidPayments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'next_payments')  List<PaymentModel> nextPayments, @JsonKey(name: 'paid_payments')  List<PaymentModel> paidPayments)?  $default,) {final _that = this;
switch (_that) {
case _PaymentsModel() when $default != null:
return $default(_that.nextPayments,_that.paidPayments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentsModel extends PaymentsModel {
  const _PaymentsModel({@JsonKey(name: 'next_payments') final  List<PaymentModel> nextPayments = const [], @JsonKey(name: 'paid_payments') final  List<PaymentModel> paidPayments = const []}): _nextPayments = nextPayments,_paidPayments = paidPayments,super._();
  factory _PaymentsModel.fromJson(Map<String, dynamic> json) => _$PaymentsModelFromJson(json);

 final  List<PaymentModel> _nextPayments;
@override@JsonKey(name: 'next_payments') List<PaymentModel> get nextPayments {
  if (_nextPayments is EqualUnmodifiableListView) return _nextPayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nextPayments);
}

 final  List<PaymentModel> _paidPayments;
@override@JsonKey(name: 'paid_payments') List<PaymentModel> get paidPayments {
  if (_paidPayments is EqualUnmodifiableListView) return _paidPayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paidPayments);
}


/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentsModelCopyWith<_PaymentsModel> get copyWith => __$PaymentsModelCopyWithImpl<_PaymentsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentsModel&&const DeepCollectionEquality().equals(other._nextPayments, _nextPayments)&&const DeepCollectionEquality().equals(other._paidPayments, _paidPayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nextPayments),const DeepCollectionEquality().hash(_paidPayments));

@override
String toString() {
  return 'PaymentsModel(nextPayments: $nextPayments, paidPayments: $paidPayments)';
}


}

/// @nodoc
abstract mixin class _$PaymentsModelCopyWith<$Res> implements $PaymentsModelCopyWith<$Res> {
  factory _$PaymentsModelCopyWith(_PaymentsModel value, $Res Function(_PaymentsModel) _then) = __$PaymentsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'next_payments') List<PaymentModel> nextPayments,@JsonKey(name: 'paid_payments') List<PaymentModel> paidPayments
});




}
/// @nodoc
class __$PaymentsModelCopyWithImpl<$Res>
    implements _$PaymentsModelCopyWith<$Res> {
  __$PaymentsModelCopyWithImpl(this._self, this._then);

  final _PaymentsModel _self;
  final $Res Function(_PaymentsModel) _then;

/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextPayments = null,Object? paidPayments = null,}) {
  return _then(_PaymentsModel(
nextPayments: null == nextPayments ? _self._nextPayments : nextPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,paidPayments: null == paidPayments ? _self._paidPayments : paidPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}


}


/// @nodoc
mixin _$PaymentModel {

@JsonKey(fromJson: _toInt) int get id;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'due_date') String get dueDate;@JsonKey(fromJson: _toDouble) double get amount; String get status;@JsonKey(name: 'contract_id', fromJson: _toInt) int get contractId;@JsonKey(name: 'product_image') String? get productImage;@JsonKey(name: 'product_category') String? get productCategory;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productName,dueDate,amount,status,contractId,productImage,productCategory);

@override
String toString() {
  return 'PaymentModel(id: $id, productName: $productName, dueDate: $dueDate, amount: $amount, status: $status, contractId: $contractId, productImage: $productImage, productCategory: $productCategory)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toInt) int id,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'due_date') String dueDate,@JsonKey(fromJson: _toDouble) double amount, String status,@JsonKey(name: 'contract_id', fromJson: _toInt) int contractId,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_category') String? productCategory
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productName = null,Object? dueDate = null,Object? amount = null,Object? status = null,Object? contractId = null,Object? productImage = freezed,Object? productCategory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount,  String status, @JsonKey(name: 'contract_id', fromJson: _toInt)  int contractId, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_category')  String? productCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.productName,_that.dueDate,_that.amount,_that.status,_that.contractId,_that.productImage,_that.productCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount,  String status, @JsonKey(name: 'contract_id', fromJson: _toInt)  int contractId, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_category')  String? productCategory)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.productName,_that.dueDate,_that.amount,_that.status,_that.contractId,_that.productImage,_that.productCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount,  String status, @JsonKey(name: 'contract_id', fromJson: _toInt)  int contractId, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_category')  String? productCategory)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.productName,_that.dueDate,_that.amount,_that.status,_that.contractId,_that.productImage,_that.productCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel extends PaymentModel {
  const _PaymentModel({@JsonKey(fromJson: _toInt) required this.id, @JsonKey(name: 'product_name') this.productName = '', @JsonKey(name: 'due_date') this.dueDate = '', @JsonKey(fromJson: _toDouble) required this.amount, this.status = '', @JsonKey(name: 'contract_id', fromJson: _toInt) required this.contractId, @JsonKey(name: 'product_image') this.productImage, @JsonKey(name: 'product_category') this.productCategory}): super._();
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override@JsonKey(fromJson: _toInt) final  int id;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override@JsonKey(fromJson: _toDouble) final  double amount;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'contract_id', fromJson: _toInt) final  int contractId;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override@JsonKey(name: 'product_category') final  String? productCategory;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productName,dueDate,amount,status,contractId,productImage,productCategory);

@override
String toString() {
  return 'PaymentModel(id: $id, productName: $productName, dueDate: $dueDate, amount: $amount, status: $status, contractId: $contractId, productImage: $productImage, productCategory: $productCategory)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toInt) int id,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'due_date') String dueDate,@JsonKey(fromJson: _toDouble) double amount, String status,@JsonKey(name: 'contract_id', fromJson: _toInt) int contractId,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_category') String? productCategory
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productName = null,Object? dueDate = null,Object? amount = null,Object? status = null,Object? contractId = null,Object? productImage = freezed,Object? productCategory = freezed,}) {
  return _then(_PaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
