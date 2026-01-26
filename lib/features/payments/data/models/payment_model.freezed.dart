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

@JsonKey(name: 'next_payments') List<PaymentModel> get nextPayments;@JsonKey(name: 'paid_payments') List<PaymentModel> get paidPayments; SummaryModel? get summary;
/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentsModelCopyWith<PaymentsModel> get copyWith => _$PaymentsModelCopyWithImpl<PaymentsModel>(this as PaymentsModel, _$identity);

  /// Serializes this PaymentsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentsModel&&const DeepCollectionEquality().equals(other.nextPayments, nextPayments)&&const DeepCollectionEquality().equals(other.paidPayments, paidPayments)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nextPayments),const DeepCollectionEquality().hash(paidPayments),summary);

@override
String toString() {
  return 'PaymentsModel(nextPayments: $nextPayments, paidPayments: $paidPayments, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $PaymentsModelCopyWith<$Res>  {
  factory $PaymentsModelCopyWith(PaymentsModel value, $Res Function(PaymentsModel) _then) = _$PaymentsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'next_payments') List<PaymentModel> nextPayments,@JsonKey(name: 'paid_payments') List<PaymentModel> paidPayments, SummaryModel? summary
});


$SummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class _$PaymentsModelCopyWithImpl<$Res>
    implements $PaymentsModelCopyWith<$Res> {
  _$PaymentsModelCopyWithImpl(this._self, this._then);

  final PaymentsModel _self;
  final $Res Function(PaymentsModel) _then;

/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextPayments = null,Object? paidPayments = null,Object? summary = freezed,}) {
  return _then(_self.copyWith(
nextPayments: null == nextPayments ? _self.nextPayments : nextPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,paidPayments: null == paidPayments ? _self.paidPayments : paidPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryModel?,
  ));
}
/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'next_payments')  List<PaymentModel> nextPayments, @JsonKey(name: 'paid_payments')  List<PaymentModel> paidPayments,  SummaryModel? summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentsModel() when $default != null:
return $default(_that.nextPayments,_that.paidPayments,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'next_payments')  List<PaymentModel> nextPayments, @JsonKey(name: 'paid_payments')  List<PaymentModel> paidPayments,  SummaryModel? summary)  $default,) {final _that = this;
switch (_that) {
case _PaymentsModel():
return $default(_that.nextPayments,_that.paidPayments,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'next_payments')  List<PaymentModel> nextPayments, @JsonKey(name: 'paid_payments')  List<PaymentModel> paidPayments,  SummaryModel? summary)?  $default,) {final _that = this;
switch (_that) {
case _PaymentsModel() when $default != null:
return $default(_that.nextPayments,_that.paidPayments,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentsModel extends PaymentsModel {
  const _PaymentsModel({@JsonKey(name: 'next_payments') final  List<PaymentModel> nextPayments = const [], @JsonKey(name: 'paid_payments') final  List<PaymentModel> paidPayments = const [], this.summary}): _nextPayments = nextPayments,_paidPayments = paidPayments,super._();
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

@override final  SummaryModel? summary;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentsModel&&const DeepCollectionEquality().equals(other._nextPayments, _nextPayments)&&const DeepCollectionEquality().equals(other._paidPayments, _paidPayments)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nextPayments),const DeepCollectionEquality().hash(_paidPayments),summary);

@override
String toString() {
  return 'PaymentsModel(nextPayments: $nextPayments, paidPayments: $paidPayments, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$PaymentsModelCopyWith<$Res> implements $PaymentsModelCopyWith<$Res> {
  factory _$PaymentsModelCopyWith(_PaymentsModel value, $Res Function(_PaymentsModel) _then) = __$PaymentsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'next_payments') List<PaymentModel> nextPayments,@JsonKey(name: 'paid_payments') List<PaymentModel> paidPayments, SummaryModel? summary
});


@override $SummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class __$PaymentsModelCopyWithImpl<$Res>
    implements _$PaymentsModelCopyWith<$Res> {
  __$PaymentsModelCopyWithImpl(this._self, this._then);

  final _PaymentsModel _self;
  final $Res Function(_PaymentsModel) _then;

/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextPayments = null,Object? paidPayments = null,Object? summary = freezed,}) {
  return _then(_PaymentsModel(
nextPayments: null == nextPayments ? _self._nextPayments : nextPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,paidPayments: null == paidPayments ? _self._paidPayments : paidPayments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryModel?,
  ));
}

/// Create a copy of PaymentsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$PaymentModel {

@JsonKey(fromJson: _toInt) int get id;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'due_date') String get dueDate;@JsonKey(fromJson: _toDouble) double get amount; String get status;@JsonKey(name: 'contract_id', fromJson: _toInt) int get contractId;@JsonKey(name: 'product_image') String? get productImage;@JsonKey(name: 'product_category') String? get productCategory; ContractModel? get contract;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory)&&(identical(other.contract, contract) || other.contract == contract));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productName,dueDate,amount,status,contractId,productImage,productCategory,contract);

@override
String toString() {
  return 'PaymentModel(id: $id, productName: $productName, dueDate: $dueDate, amount: $amount, status: $status, contractId: $contractId, productImage: $productImage, productCategory: $productCategory, contract: $contract)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toInt) int id,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'due_date') String dueDate,@JsonKey(fromJson: _toDouble) double amount, String status,@JsonKey(name: 'contract_id', fromJson: _toInt) int contractId,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_category') String? productCategory, ContractModel? contract
});


$ContractModelCopyWith<$Res>? get contract;

}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productName = null,Object? dueDate = null,Object? amount = null,Object? status = null,Object? contractId = null,Object? productImage = freezed,Object? productCategory = freezed,Object? contract = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ContractModel?,
  ));
}
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractModelCopyWith<$Res>? get contract {
    if (_self.contract == null) {
    return null;
  }

  return $ContractModelCopyWith<$Res>(_self.contract!, (value) {
    return _then(_self.copyWith(contract: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount,  String status, @JsonKey(name: 'contract_id', fromJson: _toInt)  int contractId, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_category')  String? productCategory,  ContractModel? contract)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.productName,_that.dueDate,_that.amount,_that.status,_that.contractId,_that.productImage,_that.productCategory,_that.contract);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount,  String status, @JsonKey(name: 'contract_id', fromJson: _toInt)  int contractId, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_category')  String? productCategory,  ContractModel? contract)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.productName,_that.dueDate,_that.amount,_that.status,_that.contractId,_that.productImage,_that.productCategory,_that.contract);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount,  String status, @JsonKey(name: 'contract_id', fromJson: _toInt)  int contractId, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_category')  String? productCategory,  ContractModel? contract)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.productName,_that.dueDate,_that.amount,_that.status,_that.contractId,_that.productImage,_that.productCategory,_that.contract);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel extends PaymentModel {
  const _PaymentModel({@JsonKey(fromJson: _toInt) required this.id, @JsonKey(name: 'product_name') this.productName = '', @JsonKey(name: 'due_date') this.dueDate = '', @JsonKey(fromJson: _toDouble) required this.amount, this.status = '', @JsonKey(name: 'contract_id', fromJson: _toInt) required this.contractId, @JsonKey(name: 'product_image') this.productImage, @JsonKey(name: 'product_category') this.productCategory, this.contract}): super._();
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override@JsonKey(fromJson: _toInt) final  int id;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override@JsonKey(fromJson: _toDouble) final  double amount;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'contract_id', fromJson: _toInt) final  int contractId;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override@JsonKey(name: 'product_category') final  String? productCategory;
@override final  ContractModel? contract;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productCategory, productCategory) || other.productCategory == productCategory)&&(identical(other.contract, contract) || other.contract == contract));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productName,dueDate,amount,status,contractId,productImage,productCategory,contract);

@override
String toString() {
  return 'PaymentModel(id: $id, productName: $productName, dueDate: $dueDate, amount: $amount, status: $status, contractId: $contractId, productImage: $productImage, productCategory: $productCategory, contract: $contract)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toInt) int id,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'due_date') String dueDate,@JsonKey(fromJson: _toDouble) double amount, String status,@JsonKey(name: 'contract_id', fromJson: _toInt) int contractId,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_category') String? productCategory, ContractModel? contract
});


@override $ContractModelCopyWith<$Res>? get contract;

}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productName = null,Object? dueDate = null,Object? amount = null,Object? status = null,Object? contractId = null,Object? productImage = freezed,Object? productCategory = freezed,Object? contract = freezed,}) {
  return _then(_PaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productCategory: freezed == productCategory ? _self.productCategory : productCategory // ignore: cast_nullable_to_non_nullable
as String?,contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ContractModel?,
  ));
}

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractModelCopyWith<$Res>? get contract {
    if (_self.contract == null) {
    return null;
  }

  return $ContractModelCopyWith<$Res>(_self.contract!, (value) {
    return _then(_self.copyWith(contract: value));
  });
}
}


/// @nodoc
mixin _$ContractModel {

@JsonKey(fromJson: _toInt) int get id;@JsonKey(name: 'product_id') String? get productId; ProductModel? get product;@JsonKey(name: 'service_contract_pdf') String? get serviceContractPdf;
/// Create a copy of ContractModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractModelCopyWith<ContractModel> get copyWith => _$ContractModelCopyWithImpl<ContractModel>(this as ContractModel, _$identity);

  /// Serializes this ContractModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.product, product) || other.product == product)&&(identical(other.serviceContractPdf, serviceContractPdf) || other.serviceContractPdf == serviceContractPdf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,product,serviceContractPdf);

@override
String toString() {
  return 'ContractModel(id: $id, productId: $productId, product: $product, serviceContractPdf: $serviceContractPdf)';
}


}

/// @nodoc
abstract mixin class $ContractModelCopyWith<$Res>  {
  factory $ContractModelCopyWith(ContractModel value, $Res Function(ContractModel) _then) = _$ContractModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toInt) int id,@JsonKey(name: 'product_id') String? productId, ProductModel? product,@JsonKey(name: 'service_contract_pdf') String? serviceContractPdf
});


$ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$ContractModelCopyWithImpl<$Res>
    implements $ContractModelCopyWith<$Res> {
  _$ContractModelCopyWithImpl(this._self, this._then);

  final ContractModel _self;
  final $Res Function(ContractModel) _then;

/// Create a copy of ContractModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = freezed,Object? product = freezed,Object? serviceContractPdf = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,serviceContractPdf: freezed == serviceContractPdf ? _self.serviceContractPdf : serviceContractPdf // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractModel].
extension ContractModelPatterns on ContractModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractModel value)  $default,){
final _that = this;
switch (_that) {
case _ContractModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContractModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_id')  String? productId,  ProductModel? product, @JsonKey(name: 'service_contract_pdf')  String? serviceContractPdf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractModel() when $default != null:
return $default(_that.id,_that.productId,_that.product,_that.serviceContractPdf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_id')  String? productId,  ProductModel? product, @JsonKey(name: 'service_contract_pdf')  String? serviceContractPdf)  $default,) {final _that = this;
switch (_that) {
case _ContractModel():
return $default(_that.id,_that.productId,_that.product,_that.serviceContractPdf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toInt)  int id, @JsonKey(name: 'product_id')  String? productId,  ProductModel? product, @JsonKey(name: 'service_contract_pdf')  String? serviceContractPdf)?  $default,) {final _that = this;
switch (_that) {
case _ContractModel() when $default != null:
return $default(_that.id,_that.productId,_that.product,_that.serviceContractPdf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractModel extends ContractModel {
  const _ContractModel({@JsonKey(fromJson: _toInt) required this.id, @JsonKey(name: 'product_id') this.productId, this.product, @JsonKey(name: 'service_contract_pdf') this.serviceContractPdf}): super._();
  factory _ContractModel.fromJson(Map<String, dynamic> json) => _$ContractModelFromJson(json);

@override@JsonKey(fromJson: _toInt) final  int id;
@override@JsonKey(name: 'product_id') final  String? productId;
@override final  ProductModel? product;
@override@JsonKey(name: 'service_contract_pdf') final  String? serviceContractPdf;

/// Create a copy of ContractModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractModelCopyWith<_ContractModel> get copyWith => __$ContractModelCopyWithImpl<_ContractModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.product, product) || other.product == product)&&(identical(other.serviceContractPdf, serviceContractPdf) || other.serviceContractPdf == serviceContractPdf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,product,serviceContractPdf);

@override
String toString() {
  return 'ContractModel(id: $id, productId: $productId, product: $product, serviceContractPdf: $serviceContractPdf)';
}


}

/// @nodoc
abstract mixin class _$ContractModelCopyWith<$Res> implements $ContractModelCopyWith<$Res> {
  factory _$ContractModelCopyWith(_ContractModel value, $Res Function(_ContractModel) _then) = __$ContractModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toInt) int id,@JsonKey(name: 'product_id') String? productId, ProductModel? product,@JsonKey(name: 'service_contract_pdf') String? serviceContractPdf
});


@override $ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$ContractModelCopyWithImpl<$Res>
    implements _$ContractModelCopyWith<$Res> {
  __$ContractModelCopyWithImpl(this._self, this._then);

  final _ContractModel _self;
  final $Res Function(_ContractModel) _then;

/// Create a copy of ContractModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = freezed,Object? product = freezed,Object? serviceContractPdf = freezed,}) {
  return _then(_ContractModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,serviceContractPdf: freezed == serviceContractPdf ? _self.serviceContractPdf : serviceContractPdf // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$ProductModel {

 String? get id; String get name;@JsonKey(name: 'custom_fields') Map<String, dynamic> get customFields;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.customFields, customFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(customFields));

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, customFields: $customFields)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String? id, String name,@JsonKey(name: 'custom_fields') Map<String, dynamic> customFields
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? customFields = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customFields: null == customFields ? _self.customFields : customFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name, @JsonKey(name: 'custom_fields')  Map<String, dynamic> customFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.customFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name, @JsonKey(name: 'custom_fields')  Map<String, dynamic> customFields)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.name,_that.customFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name, @JsonKey(name: 'custom_fields')  Map<String, dynamic> customFields)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.customFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel extends ProductModel {
  const _ProductModel({this.id, this.name = '', @JsonKey(name: 'custom_fields') final  Map<String, dynamic> customFields = const {}}): _customFields = customFields,super._();
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  String? id;
@override@JsonKey() final  String name;
 final  Map<String, dynamic> _customFields;
@override@JsonKey(name: 'custom_fields') Map<String, dynamic> get customFields {
  if (_customFields is EqualUnmodifiableMapView) return _customFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customFields);
}


/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._customFields, _customFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_customFields));

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, customFields: $customFields)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name,@JsonKey(name: 'custom_fields') Map<String, dynamic> customFields
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? customFields = null,}) {
  return _then(_ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customFields: null == customFields ? _self._customFields : customFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$SummaryModel {

@JsonKey(name: 'total_contracts') int get totalContracts;@JsonKey(name: 'total_payments') int get totalPayments;@JsonKey(name: 'paid_count') int get paidCount;@JsonKey(name: 'remaining_count') int get remainingCount;@JsonKey(name: 'total_paid') double get totalPaid;@JsonKey(name: 'total_remaining') double get totalRemaining;@JsonKey(name: 'completion_percentage') int get completionPercentage;
/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<SummaryModel> get copyWith => _$SummaryModelCopyWithImpl<SummaryModel>(this as SummaryModel, _$identity);

  /// Serializes this SummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryModel&&(identical(other.totalContracts, totalContracts) || other.totalContracts == totalContracts)&&(identical(other.totalPayments, totalPayments) || other.totalPayments == totalPayments)&&(identical(other.paidCount, paidCount) || other.paidCount == paidCount)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalRemaining, totalRemaining) || other.totalRemaining == totalRemaining)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalContracts,totalPayments,paidCount,remainingCount,totalPaid,totalRemaining,completionPercentage);

@override
String toString() {
  return 'SummaryModel(totalContracts: $totalContracts, totalPayments: $totalPayments, paidCount: $paidCount, remainingCount: $remainingCount, totalPaid: $totalPaid, totalRemaining: $totalRemaining, completionPercentage: $completionPercentage)';
}


}

/// @nodoc
abstract mixin class $SummaryModelCopyWith<$Res>  {
  factory $SummaryModelCopyWith(SummaryModel value, $Res Function(SummaryModel) _then) = _$SummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_contracts') int totalContracts,@JsonKey(name: 'total_payments') int totalPayments,@JsonKey(name: 'paid_count') int paidCount,@JsonKey(name: 'remaining_count') int remainingCount,@JsonKey(name: 'total_paid') double totalPaid,@JsonKey(name: 'total_remaining') double totalRemaining,@JsonKey(name: 'completion_percentage') int completionPercentage
});




}
/// @nodoc
class _$SummaryModelCopyWithImpl<$Res>
    implements $SummaryModelCopyWith<$Res> {
  _$SummaryModelCopyWithImpl(this._self, this._then);

  final SummaryModel _self;
  final $Res Function(SummaryModel) _then;

/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalContracts = null,Object? totalPayments = null,Object? paidCount = null,Object? remainingCount = null,Object? totalPaid = null,Object? totalRemaining = null,Object? completionPercentage = null,}) {
  return _then(_self.copyWith(
totalContracts: null == totalContracts ? _self.totalContracts : totalContracts // ignore: cast_nullable_to_non_nullable
as int,totalPayments: null == totalPayments ? _self.totalPayments : totalPayments // ignore: cast_nullable_to_non_nullable
as int,paidCount: null == paidCount ? _self.paidCount : paidCount // ignore: cast_nullable_to_non_nullable
as int,remainingCount: null == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalRemaining: null == totalRemaining ? _self.totalRemaining : totalRemaining // ignore: cast_nullable_to_non_nullable
as double,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryModel].
extension SummaryModelPatterns on SummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _SummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_contracts')  int totalContracts, @JsonKey(name: 'total_payments')  int totalPayments, @JsonKey(name: 'paid_count')  int paidCount, @JsonKey(name: 'remaining_count')  int remainingCount, @JsonKey(name: 'total_paid')  double totalPaid, @JsonKey(name: 'total_remaining')  double totalRemaining, @JsonKey(name: 'completion_percentage')  int completionPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
return $default(_that.totalContracts,_that.totalPayments,_that.paidCount,_that.remainingCount,_that.totalPaid,_that.totalRemaining,_that.completionPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_contracts')  int totalContracts, @JsonKey(name: 'total_payments')  int totalPayments, @JsonKey(name: 'paid_count')  int paidCount, @JsonKey(name: 'remaining_count')  int remainingCount, @JsonKey(name: 'total_paid')  double totalPaid, @JsonKey(name: 'total_remaining')  double totalRemaining, @JsonKey(name: 'completion_percentage')  int completionPercentage)  $default,) {final _that = this;
switch (_that) {
case _SummaryModel():
return $default(_that.totalContracts,_that.totalPayments,_that.paidCount,_that.remainingCount,_that.totalPaid,_that.totalRemaining,_that.completionPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_contracts')  int totalContracts, @JsonKey(name: 'total_payments')  int totalPayments, @JsonKey(name: 'paid_count')  int paidCount, @JsonKey(name: 'remaining_count')  int remainingCount, @JsonKey(name: 'total_paid')  double totalPaid, @JsonKey(name: 'total_remaining')  double totalRemaining, @JsonKey(name: 'completion_percentage')  int completionPercentage)?  $default,) {final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
return $default(_that.totalContracts,_that.totalPayments,_that.paidCount,_that.remainingCount,_that.totalPaid,_that.totalRemaining,_that.completionPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryModel extends SummaryModel {
  const _SummaryModel({@JsonKey(name: 'total_contracts') this.totalContracts = 0, @JsonKey(name: 'total_payments') this.totalPayments = 0, @JsonKey(name: 'paid_count') this.paidCount = 0, @JsonKey(name: 'remaining_count') this.remainingCount = 0, @JsonKey(name: 'total_paid') this.totalPaid = 0.0, @JsonKey(name: 'total_remaining') this.totalRemaining = 0.0, @JsonKey(name: 'completion_percentage') this.completionPercentage = 0}): super._();
  factory _SummaryModel.fromJson(Map<String, dynamic> json) => _$SummaryModelFromJson(json);

@override@JsonKey(name: 'total_contracts') final  int totalContracts;
@override@JsonKey(name: 'total_payments') final  int totalPayments;
@override@JsonKey(name: 'paid_count') final  int paidCount;
@override@JsonKey(name: 'remaining_count') final  int remainingCount;
@override@JsonKey(name: 'total_paid') final  double totalPaid;
@override@JsonKey(name: 'total_remaining') final  double totalRemaining;
@override@JsonKey(name: 'completion_percentage') final  int completionPercentage;

/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryModelCopyWith<_SummaryModel> get copyWith => __$SummaryModelCopyWithImpl<_SummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryModel&&(identical(other.totalContracts, totalContracts) || other.totalContracts == totalContracts)&&(identical(other.totalPayments, totalPayments) || other.totalPayments == totalPayments)&&(identical(other.paidCount, paidCount) || other.paidCount == paidCount)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalRemaining, totalRemaining) || other.totalRemaining == totalRemaining)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalContracts,totalPayments,paidCount,remainingCount,totalPaid,totalRemaining,completionPercentage);

@override
String toString() {
  return 'SummaryModel(totalContracts: $totalContracts, totalPayments: $totalPayments, paidCount: $paidCount, remainingCount: $remainingCount, totalPaid: $totalPaid, totalRemaining: $totalRemaining, completionPercentage: $completionPercentage)';
}


}

/// @nodoc
abstract mixin class _$SummaryModelCopyWith<$Res> implements $SummaryModelCopyWith<$Res> {
  factory _$SummaryModelCopyWith(_SummaryModel value, $Res Function(_SummaryModel) _then) = __$SummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_contracts') int totalContracts,@JsonKey(name: 'total_payments') int totalPayments,@JsonKey(name: 'paid_count') int paidCount,@JsonKey(name: 'remaining_count') int remainingCount,@JsonKey(name: 'total_paid') double totalPaid,@JsonKey(name: 'total_remaining') double totalRemaining,@JsonKey(name: 'completion_percentage') int completionPercentage
});




}
/// @nodoc
class __$SummaryModelCopyWithImpl<$Res>
    implements _$SummaryModelCopyWith<$Res> {
  __$SummaryModelCopyWithImpl(this._self, this._then);

  final _SummaryModel _self;
  final $Res Function(_SummaryModel) _then;

/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalContracts = null,Object? totalPayments = null,Object? paidCount = null,Object? remainingCount = null,Object? totalPaid = null,Object? totalRemaining = null,Object? completionPercentage = null,}) {
  return _then(_SummaryModel(
totalContracts: null == totalContracts ? _self.totalContracts : totalContracts // ignore: cast_nullable_to_non_nullable
as int,totalPayments: null == totalPayments ? _self.totalPayments : totalPayments // ignore: cast_nullable_to_non_nullable
as int,paidCount: null == paidCount ? _self.paidCount : paidCount // ignore: cast_nullable_to_non_nullable
as int,remainingCount: null == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalRemaining: null == totalRemaining ? _self.totalRemaining : totalRemaining // ignore: cast_nullable_to_non_nullable
as double,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
