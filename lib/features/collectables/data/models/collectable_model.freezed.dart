// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collectable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectablesModel {

 List<CollectableContractModel> get contracts;
/// Create a copy of CollectablesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectablesModelCopyWith<CollectablesModel> get copyWith => _$CollectablesModelCopyWithImpl<CollectablesModel>(this as CollectablesModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectablesModel&&const DeepCollectionEquality().equals(other.contracts, contracts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contracts));

@override
String toString() {
  return 'CollectablesModel(contracts: $contracts)';
}


}

/// @nodoc
abstract mixin class $CollectablesModelCopyWith<$Res>  {
  factory $CollectablesModelCopyWith(CollectablesModel value, $Res Function(CollectablesModel) _then) = _$CollectablesModelCopyWithImpl;
@useResult
$Res call({
 List<CollectableContractModel> contracts
});




}
/// @nodoc
class _$CollectablesModelCopyWithImpl<$Res>
    implements $CollectablesModelCopyWith<$Res> {
  _$CollectablesModelCopyWithImpl(this._self, this._then);

  final CollectablesModel _self;
  final $Res Function(CollectablesModel) _then;

/// Create a copy of CollectablesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contracts = null,}) {
  return _then(_self.copyWith(
contracts: null == contracts ? _self.contracts : contracts // ignore: cast_nullable_to_non_nullable
as List<CollectableContractModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectablesModel].
extension CollectablesModelPatterns on CollectablesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectablesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectablesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectablesModel value)  $default,){
final _that = this;
switch (_that) {
case _CollectablesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectablesModel value)?  $default,){
final _that = this;
switch (_that) {
case _CollectablesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CollectableContractModel> contracts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectablesModel() when $default != null:
return $default(_that.contracts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CollectableContractModel> contracts)  $default,) {final _that = this;
switch (_that) {
case _CollectablesModel():
return $default(_that.contracts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CollectableContractModel> contracts)?  $default,) {final _that = this;
switch (_that) {
case _CollectablesModel() when $default != null:
return $default(_that.contracts);case _:
  return null;

}
}

}

/// @nodoc


class _CollectablesModel extends CollectablesModel {
  const _CollectablesModel({final  List<CollectableContractModel> contracts = const []}): _contracts = contracts,super._();
  

 final  List<CollectableContractModel> _contracts;
@override@JsonKey() List<CollectableContractModel> get contracts {
  if (_contracts is EqualUnmodifiableListView) return _contracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contracts);
}


/// Create a copy of CollectablesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectablesModelCopyWith<_CollectablesModel> get copyWith => __$CollectablesModelCopyWithImpl<_CollectablesModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectablesModel&&const DeepCollectionEquality().equals(other._contracts, _contracts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contracts));

@override
String toString() {
  return 'CollectablesModel(contracts: $contracts)';
}


}

/// @nodoc
abstract mixin class _$CollectablesModelCopyWith<$Res> implements $CollectablesModelCopyWith<$Res> {
  factory _$CollectablesModelCopyWith(_CollectablesModel value, $Res Function(_CollectablesModel) _then) = __$CollectablesModelCopyWithImpl;
@override @useResult
$Res call({
 List<CollectableContractModel> contracts
});




}
/// @nodoc
class __$CollectablesModelCopyWithImpl<$Res>
    implements _$CollectablesModelCopyWith<$Res> {
  __$CollectablesModelCopyWithImpl(this._self, this._then);

  final _CollectablesModel _self;
  final $Res Function(_CollectablesModel) _then;

/// Create a copy of CollectablesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contracts = null,}) {
  return _then(_CollectablesModel(
contracts: null == contracts ? _self._contracts : contracts // ignore: cast_nullable_to_non_nullable
as List<CollectableContractModel>,
  ));
}


}


/// @nodoc
mixin _$CollectableContractModel {

 String get id;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'approved_by_admin') String? get approvedByAdmin;@JsonKey(name: 'contract_type') String get contractType;@JsonKey(name: 'collector_id') String? get collectorId;@JsonKey(name: 'payment_type') String get paymentType; List<CollectablePaymentModel> get payments; UserInfoModel? get user; ProductInfoModel? get product; CollectorInfoModel? get collector;
/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectableContractModelCopyWith<CollectableContractModel> get copyWith => _$CollectableContractModelCopyWithImpl<CollectableContractModel>(this as CollectableContractModel, _$identity);

  /// Serializes this CollectableContractModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectableContractModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.approvedByAdmin, approvedByAdmin) || other.approvedByAdmin == approvedByAdmin)&&(identical(other.contractType, contractType) || other.contractType == contractType)&&(identical(other.collectorId, collectorId) || other.collectorId == collectorId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&const DeepCollectionEquality().equals(other.payments, payments)&&(identical(other.user, user) || other.user == user)&&(identical(other.product, product) || other.product == product)&&(identical(other.collector, collector) || other.collector == collector));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,userId,approvedByAdmin,contractType,collectorId,paymentType,const DeepCollectionEquality().hash(payments),user,product,collector);

@override
String toString() {
  return 'CollectableContractModel(id: $id, productId: $productId, userId: $userId, approvedByAdmin: $approvedByAdmin, contractType: $contractType, collectorId: $collectorId, paymentType: $paymentType, payments: $payments, user: $user, product: $product, collector: $collector)';
}


}

/// @nodoc
abstract mixin class $CollectableContractModelCopyWith<$Res>  {
  factory $CollectableContractModelCopyWith(CollectableContractModel value, $Res Function(CollectableContractModel) _then) = _$CollectableContractModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'approved_by_admin') String? approvedByAdmin,@JsonKey(name: 'contract_type') String contractType,@JsonKey(name: 'collector_id') String? collectorId,@JsonKey(name: 'payment_type') String paymentType, List<CollectablePaymentModel> payments, UserInfoModel? user, ProductInfoModel? product, CollectorInfoModel? collector
});


$UserInfoModelCopyWith<$Res>? get user;$ProductInfoModelCopyWith<$Res>? get product;$CollectorInfoModelCopyWith<$Res>? get collector;

}
/// @nodoc
class _$CollectableContractModelCopyWithImpl<$Res>
    implements $CollectableContractModelCopyWith<$Res> {
  _$CollectableContractModelCopyWithImpl(this._self, this._then);

  final CollectableContractModel _self;
  final $Res Function(CollectableContractModel) _then;

/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? userId = null,Object? approvedByAdmin = freezed,Object? contractType = null,Object? collectorId = freezed,Object? paymentType = null,Object? payments = null,Object? user = freezed,Object? product = freezed,Object? collector = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,approvedByAdmin: freezed == approvedByAdmin ? _self.approvedByAdmin : approvedByAdmin // ignore: cast_nullable_to_non_nullable
as String?,contractType: null == contractType ? _self.contractType : contractType // ignore: cast_nullable_to_non_nullable
as String,collectorId: freezed == collectorId ? _self.collectorId : collectorId // ignore: cast_nullable_to_non_nullable
as String?,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<CollectablePaymentModel>,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfoModel?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfoModel?,collector: freezed == collector ? _self.collector : collector // ignore: cast_nullable_to_non_nullable
as CollectorInfoModel?,
  ));
}
/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserInfoModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductInfoModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectorInfoModelCopyWith<$Res>? get collector {
    if (_self.collector == null) {
    return null;
  }

  return $CollectorInfoModelCopyWith<$Res>(_self.collector!, (value) {
    return _then(_self.copyWith(collector: value));
  });
}
}


/// Adds pattern-matching-related methods to [CollectableContractModel].
extension CollectableContractModelPatterns on CollectableContractModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectableContractModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectableContractModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectableContractModel value)  $default,){
final _that = this;
switch (_that) {
case _CollectableContractModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectableContractModel value)?  $default,){
final _that = this;
switch (_that) {
case _CollectableContractModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'approved_by_admin')  String? approvedByAdmin, @JsonKey(name: 'contract_type')  String contractType, @JsonKey(name: 'collector_id')  String? collectorId, @JsonKey(name: 'payment_type')  String paymentType,  List<CollectablePaymentModel> payments,  UserInfoModel? user,  ProductInfoModel? product,  CollectorInfoModel? collector)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectableContractModel() when $default != null:
return $default(_that.id,_that.productId,_that.userId,_that.approvedByAdmin,_that.contractType,_that.collectorId,_that.paymentType,_that.payments,_that.user,_that.product,_that.collector);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'approved_by_admin')  String? approvedByAdmin, @JsonKey(name: 'contract_type')  String contractType, @JsonKey(name: 'collector_id')  String? collectorId, @JsonKey(name: 'payment_type')  String paymentType,  List<CollectablePaymentModel> payments,  UserInfoModel? user,  ProductInfoModel? product,  CollectorInfoModel? collector)  $default,) {final _that = this;
switch (_that) {
case _CollectableContractModel():
return $default(_that.id,_that.productId,_that.userId,_that.approvedByAdmin,_that.contractType,_that.collectorId,_that.paymentType,_that.payments,_that.user,_that.product,_that.collector);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'approved_by_admin')  String? approvedByAdmin, @JsonKey(name: 'contract_type')  String contractType, @JsonKey(name: 'collector_id')  String? collectorId, @JsonKey(name: 'payment_type')  String paymentType,  List<CollectablePaymentModel> payments,  UserInfoModel? user,  ProductInfoModel? product,  CollectorInfoModel? collector)?  $default,) {final _that = this;
switch (_that) {
case _CollectableContractModel() when $default != null:
return $default(_that.id,_that.productId,_that.userId,_that.approvedByAdmin,_that.contractType,_that.collectorId,_that.paymentType,_that.payments,_that.user,_that.product,_that.collector);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollectableContractModel extends CollectableContractModel {
  const _CollectableContractModel({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'approved_by_admin') this.approvedByAdmin, @JsonKey(name: 'contract_type') required this.contractType, @JsonKey(name: 'collector_id') this.collectorId, @JsonKey(name: 'payment_type') required this.paymentType, final  List<CollectablePaymentModel> payments = const [], this.user, this.product, this.collector}): _payments = payments,super._();
  factory _CollectableContractModel.fromJson(Map<String, dynamic> json) => _$CollectableContractModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'approved_by_admin') final  String? approvedByAdmin;
@override@JsonKey(name: 'contract_type') final  String contractType;
@override@JsonKey(name: 'collector_id') final  String? collectorId;
@override@JsonKey(name: 'payment_type') final  String paymentType;
 final  List<CollectablePaymentModel> _payments;
@override@JsonKey() List<CollectablePaymentModel> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}

@override final  UserInfoModel? user;
@override final  ProductInfoModel? product;
@override final  CollectorInfoModel? collector;

/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectableContractModelCopyWith<_CollectableContractModel> get copyWith => __$CollectableContractModelCopyWithImpl<_CollectableContractModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectableContractModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectableContractModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.approvedByAdmin, approvedByAdmin) || other.approvedByAdmin == approvedByAdmin)&&(identical(other.contractType, contractType) || other.contractType == contractType)&&(identical(other.collectorId, collectorId) || other.collectorId == collectorId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&const DeepCollectionEquality().equals(other._payments, _payments)&&(identical(other.user, user) || other.user == user)&&(identical(other.product, product) || other.product == product)&&(identical(other.collector, collector) || other.collector == collector));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,userId,approvedByAdmin,contractType,collectorId,paymentType,const DeepCollectionEquality().hash(_payments),user,product,collector);

@override
String toString() {
  return 'CollectableContractModel(id: $id, productId: $productId, userId: $userId, approvedByAdmin: $approvedByAdmin, contractType: $contractType, collectorId: $collectorId, paymentType: $paymentType, payments: $payments, user: $user, product: $product, collector: $collector)';
}


}

/// @nodoc
abstract mixin class _$CollectableContractModelCopyWith<$Res> implements $CollectableContractModelCopyWith<$Res> {
  factory _$CollectableContractModelCopyWith(_CollectableContractModel value, $Res Function(_CollectableContractModel) _then) = __$CollectableContractModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'approved_by_admin') String? approvedByAdmin,@JsonKey(name: 'contract_type') String contractType,@JsonKey(name: 'collector_id') String? collectorId,@JsonKey(name: 'payment_type') String paymentType, List<CollectablePaymentModel> payments, UserInfoModel? user, ProductInfoModel? product, CollectorInfoModel? collector
});


@override $UserInfoModelCopyWith<$Res>? get user;@override $ProductInfoModelCopyWith<$Res>? get product;@override $CollectorInfoModelCopyWith<$Res>? get collector;

}
/// @nodoc
class __$CollectableContractModelCopyWithImpl<$Res>
    implements _$CollectableContractModelCopyWith<$Res> {
  __$CollectableContractModelCopyWithImpl(this._self, this._then);

  final _CollectableContractModel _self;
  final $Res Function(_CollectableContractModel) _then;

/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? userId = null,Object? approvedByAdmin = freezed,Object? contractType = null,Object? collectorId = freezed,Object? paymentType = null,Object? payments = null,Object? user = freezed,Object? product = freezed,Object? collector = freezed,}) {
  return _then(_CollectableContractModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,approvedByAdmin: freezed == approvedByAdmin ? _self.approvedByAdmin : approvedByAdmin // ignore: cast_nullable_to_non_nullable
as String?,contractType: null == contractType ? _self.contractType : contractType // ignore: cast_nullable_to_non_nullable
as String,collectorId: freezed == collectorId ? _self.collectorId : collectorId // ignore: cast_nullable_to_non_nullable
as String?,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<CollectablePaymentModel>,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfoModel?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfoModel?,collector: freezed == collector ? _self.collector : collector // ignore: cast_nullable_to_non_nullable
as CollectorInfoModel?,
  ));
}

/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserInfoModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductInfoModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of CollectableContractModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectorInfoModelCopyWith<$Res>? get collector {
    if (_self.collector == null) {
    return null;
  }

  return $CollectorInfoModelCopyWith<$Res>(_self.collector!, (value) {
    return _then(_self.copyWith(collector: value));
  });
}
}


/// @nodoc
mixin _$CollectablePaymentModel {

 String get id;@JsonKey(name: 'contract_id') String get contractId;@JsonKey(name: 'currency_id') String get currencyId;@JsonKey(name: 'collector_id') String? get collectorId;@JsonKey(name: 'payment_number') int get paymentNumber;@JsonKey(name: 'due_date') String get dueDate;@JsonKey(fromJson: _toDouble) double get amount;@JsonKey(name: 'amount_paid', fromJson: _toDouble) double get amountPaid;@JsonKey(name: 'amount_remaining', fromJson: _toDouble) double get amountRemaining; String get status;@JsonKey(name: 'paid_date') String? get paidDate;@JsonKey(name: 'payment_method_id') String? get paymentMethodId;@JsonKey(name: 'days_overdue') int get daysOverdue;@JsonKey(name: 'reminder_sent') bool get reminderSent;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of CollectablePaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectablePaymentModelCopyWith<CollectablePaymentModel> get copyWith => _$CollectablePaymentModelCopyWithImpl<CollectablePaymentModel>(this as CollectablePaymentModel, _$identity);

  /// Serializes this CollectablePaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectablePaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.collectorId, collectorId) || other.collectorId == collectorId)&&(identical(other.paymentNumber, paymentNumber) || other.paymentNumber == paymentNumber)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.paidDate, paidDate) || other.paidDate == paidDate)&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId)&&(identical(other.daysOverdue, daysOverdue) || other.daysOverdue == daysOverdue)&&(identical(other.reminderSent, reminderSent) || other.reminderSent == reminderSent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contractId,currencyId,collectorId,paymentNumber,dueDate,amount,amountPaid,amountRemaining,status,paidDate,paymentMethodId,daysOverdue,reminderSent,createdAt);

@override
String toString() {
  return 'CollectablePaymentModel(id: $id, contractId: $contractId, currencyId: $currencyId, collectorId: $collectorId, paymentNumber: $paymentNumber, dueDate: $dueDate, amount: $amount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, status: $status, paidDate: $paidDate, paymentMethodId: $paymentMethodId, daysOverdue: $daysOverdue, reminderSent: $reminderSent, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CollectablePaymentModelCopyWith<$Res>  {
  factory $CollectablePaymentModelCopyWith(CollectablePaymentModel value, $Res Function(CollectablePaymentModel) _then) = _$CollectablePaymentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'contract_id') String contractId,@JsonKey(name: 'currency_id') String currencyId,@JsonKey(name: 'collector_id') String? collectorId,@JsonKey(name: 'payment_number') int paymentNumber,@JsonKey(name: 'due_date') String dueDate,@JsonKey(fromJson: _toDouble) double amount,@JsonKey(name: 'amount_paid', fromJson: _toDouble) double amountPaid,@JsonKey(name: 'amount_remaining', fromJson: _toDouble) double amountRemaining, String status,@JsonKey(name: 'paid_date') String? paidDate,@JsonKey(name: 'payment_method_id') String? paymentMethodId,@JsonKey(name: 'days_overdue') int daysOverdue,@JsonKey(name: 'reminder_sent') bool reminderSent,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$CollectablePaymentModelCopyWithImpl<$Res>
    implements $CollectablePaymentModelCopyWith<$Res> {
  _$CollectablePaymentModelCopyWithImpl(this._self, this._then);

  final CollectablePaymentModel _self;
  final $Res Function(CollectablePaymentModel) _then;

/// Create a copy of CollectablePaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? contractId = null,Object? currencyId = null,Object? collectorId = freezed,Object? paymentNumber = null,Object? dueDate = null,Object? amount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? status = null,Object? paidDate = freezed,Object? paymentMethodId = freezed,Object? daysOverdue = null,Object? reminderSent = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as String,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,collectorId: freezed == collectorId ? _self.collectorId : collectorId // ignore: cast_nullable_to_non_nullable
as String?,paymentNumber: null == paymentNumber ? _self.paymentNumber : paymentNumber // ignore: cast_nullable_to_non_nullable
as int,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paidDate: freezed == paidDate ? _self.paidDate : paidDate // ignore: cast_nullable_to_non_nullable
as String?,paymentMethodId: freezed == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as String?,daysOverdue: null == daysOverdue ? _self.daysOverdue : daysOverdue // ignore: cast_nullable_to_non_nullable
as int,reminderSent: null == reminderSent ? _self.reminderSent : reminderSent // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectablePaymentModel].
extension CollectablePaymentModelPatterns on CollectablePaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectablePaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectablePaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectablePaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _CollectablePaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectablePaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CollectablePaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'contract_id')  String contractId, @JsonKey(name: 'currency_id')  String currencyId, @JsonKey(name: 'collector_id')  String? collectorId, @JsonKey(name: 'payment_number')  int paymentNumber, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount, @JsonKey(name: 'amount_paid', fromJson: _toDouble)  double amountPaid, @JsonKey(name: 'amount_remaining', fromJson: _toDouble)  double amountRemaining,  String status, @JsonKey(name: 'paid_date')  String? paidDate, @JsonKey(name: 'payment_method_id')  String? paymentMethodId, @JsonKey(name: 'days_overdue')  int daysOverdue, @JsonKey(name: 'reminder_sent')  bool reminderSent, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectablePaymentModel() when $default != null:
return $default(_that.id,_that.contractId,_that.currencyId,_that.collectorId,_that.paymentNumber,_that.dueDate,_that.amount,_that.amountPaid,_that.amountRemaining,_that.status,_that.paidDate,_that.paymentMethodId,_that.daysOverdue,_that.reminderSent,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'contract_id')  String contractId, @JsonKey(name: 'currency_id')  String currencyId, @JsonKey(name: 'collector_id')  String? collectorId, @JsonKey(name: 'payment_number')  int paymentNumber, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount, @JsonKey(name: 'amount_paid', fromJson: _toDouble)  double amountPaid, @JsonKey(name: 'amount_remaining', fromJson: _toDouble)  double amountRemaining,  String status, @JsonKey(name: 'paid_date')  String? paidDate, @JsonKey(name: 'payment_method_id')  String? paymentMethodId, @JsonKey(name: 'days_overdue')  int daysOverdue, @JsonKey(name: 'reminder_sent')  bool reminderSent, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _CollectablePaymentModel():
return $default(_that.id,_that.contractId,_that.currencyId,_that.collectorId,_that.paymentNumber,_that.dueDate,_that.amount,_that.amountPaid,_that.amountRemaining,_that.status,_that.paidDate,_that.paymentMethodId,_that.daysOverdue,_that.reminderSent,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'contract_id')  String contractId, @JsonKey(name: 'currency_id')  String currencyId, @JsonKey(name: 'collector_id')  String? collectorId, @JsonKey(name: 'payment_number')  int paymentNumber, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(fromJson: _toDouble)  double amount, @JsonKey(name: 'amount_paid', fromJson: _toDouble)  double amountPaid, @JsonKey(name: 'amount_remaining', fromJson: _toDouble)  double amountRemaining,  String status, @JsonKey(name: 'paid_date')  String? paidDate, @JsonKey(name: 'payment_method_id')  String? paymentMethodId, @JsonKey(name: 'days_overdue')  int daysOverdue, @JsonKey(name: 'reminder_sent')  bool reminderSent, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CollectablePaymentModel() when $default != null:
return $default(_that.id,_that.contractId,_that.currencyId,_that.collectorId,_that.paymentNumber,_that.dueDate,_that.amount,_that.amountPaid,_that.amountRemaining,_that.status,_that.paidDate,_that.paymentMethodId,_that.daysOverdue,_that.reminderSent,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollectablePaymentModel extends CollectablePaymentModel {
  const _CollectablePaymentModel({required this.id, @JsonKey(name: 'contract_id') required this.contractId, @JsonKey(name: 'currency_id') required this.currencyId, @JsonKey(name: 'collector_id') this.collectorId, @JsonKey(name: 'payment_number') required this.paymentNumber, @JsonKey(name: 'due_date') required this.dueDate, @JsonKey(fromJson: _toDouble) required this.amount, @JsonKey(name: 'amount_paid', fromJson: _toDouble) required this.amountPaid, @JsonKey(name: 'amount_remaining', fromJson: _toDouble) required this.amountRemaining, required this.status, @JsonKey(name: 'paid_date') this.paidDate, @JsonKey(name: 'payment_method_id') this.paymentMethodId, @JsonKey(name: 'days_overdue') this.daysOverdue = 0, @JsonKey(name: 'reminder_sent') this.reminderSent = false, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _CollectablePaymentModel.fromJson(Map<String, dynamic> json) => _$CollectablePaymentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'contract_id') final  String contractId;
@override@JsonKey(name: 'currency_id') final  String currencyId;
@override@JsonKey(name: 'collector_id') final  String? collectorId;
@override@JsonKey(name: 'payment_number') final  int paymentNumber;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override@JsonKey(fromJson: _toDouble) final  double amount;
@override@JsonKey(name: 'amount_paid', fromJson: _toDouble) final  double amountPaid;
@override@JsonKey(name: 'amount_remaining', fromJson: _toDouble) final  double amountRemaining;
@override final  String status;
@override@JsonKey(name: 'paid_date') final  String? paidDate;
@override@JsonKey(name: 'payment_method_id') final  String? paymentMethodId;
@override@JsonKey(name: 'days_overdue') final  int daysOverdue;
@override@JsonKey(name: 'reminder_sent') final  bool reminderSent;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of CollectablePaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectablePaymentModelCopyWith<_CollectablePaymentModel> get copyWith => __$CollectablePaymentModelCopyWithImpl<_CollectablePaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectablePaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectablePaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.collectorId, collectorId) || other.collectorId == collectorId)&&(identical(other.paymentNumber, paymentNumber) || other.paymentNumber == paymentNumber)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.paidDate, paidDate) || other.paidDate == paidDate)&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId)&&(identical(other.daysOverdue, daysOverdue) || other.daysOverdue == daysOverdue)&&(identical(other.reminderSent, reminderSent) || other.reminderSent == reminderSent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contractId,currencyId,collectorId,paymentNumber,dueDate,amount,amountPaid,amountRemaining,status,paidDate,paymentMethodId,daysOverdue,reminderSent,createdAt);

@override
String toString() {
  return 'CollectablePaymentModel(id: $id, contractId: $contractId, currencyId: $currencyId, collectorId: $collectorId, paymentNumber: $paymentNumber, dueDate: $dueDate, amount: $amount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, status: $status, paidDate: $paidDate, paymentMethodId: $paymentMethodId, daysOverdue: $daysOverdue, reminderSent: $reminderSent, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CollectablePaymentModelCopyWith<$Res> implements $CollectablePaymentModelCopyWith<$Res> {
  factory _$CollectablePaymentModelCopyWith(_CollectablePaymentModel value, $Res Function(_CollectablePaymentModel) _then) = __$CollectablePaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'contract_id') String contractId,@JsonKey(name: 'currency_id') String currencyId,@JsonKey(name: 'collector_id') String? collectorId,@JsonKey(name: 'payment_number') int paymentNumber,@JsonKey(name: 'due_date') String dueDate,@JsonKey(fromJson: _toDouble) double amount,@JsonKey(name: 'amount_paid', fromJson: _toDouble) double amountPaid,@JsonKey(name: 'amount_remaining', fromJson: _toDouble) double amountRemaining, String status,@JsonKey(name: 'paid_date') String? paidDate,@JsonKey(name: 'payment_method_id') String? paymentMethodId,@JsonKey(name: 'days_overdue') int daysOverdue,@JsonKey(name: 'reminder_sent') bool reminderSent,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$CollectablePaymentModelCopyWithImpl<$Res>
    implements _$CollectablePaymentModelCopyWith<$Res> {
  __$CollectablePaymentModelCopyWithImpl(this._self, this._then);

  final _CollectablePaymentModel _self;
  final $Res Function(_CollectablePaymentModel) _then;

/// Create a copy of CollectablePaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contractId = null,Object? currencyId = null,Object? collectorId = freezed,Object? paymentNumber = null,Object? dueDate = null,Object? amount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? status = null,Object? paidDate = freezed,Object? paymentMethodId = freezed,Object? daysOverdue = null,Object? reminderSent = null,Object? createdAt = null,}) {
  return _then(_CollectablePaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as String,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,collectorId: freezed == collectorId ? _self.collectorId : collectorId // ignore: cast_nullable_to_non_nullable
as String?,paymentNumber: null == paymentNumber ? _self.paymentNumber : paymentNumber // ignore: cast_nullable_to_non_nullable
as int,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paidDate: freezed == paidDate ? _self.paidDate : paidDate // ignore: cast_nullable_to_non_nullable
as String?,paymentMethodId: freezed == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as String?,daysOverdue: null == daysOverdue ? _self.daysOverdue : daysOverdue // ignore: cast_nullable_to_non_nullable
as int,reminderSent: null == reminderSent ? _self.reminderSent : reminderSent // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserInfoModel {

@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName;@JsonKey(name: 'phone_number') String? get phoneNumber;
/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<UserInfoModel> get copyWith => _$UserInfoModelCopyWithImpl<UserInfoModel>(this as UserInfoModel, _$identity);

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phoneNumber);

@override
String toString() {
  return 'UserInfoModel(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $UserInfoModelCopyWith<$Res>  {
  factory $UserInfoModelCopyWith(UserInfoModel value, $Res Function(UserInfoModel) _then) = _$UserInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'phone_number') String? phoneNumber
});




}
/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._self, this._then);

  final UserInfoModel _self;
  final $Res Function(UserInfoModel) _then;

/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? phoneNumber = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfoModel].
extension UserInfoModelPatterns on UserInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _UserInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'phone_number')  String? phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'phone_number')  String? phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _UserInfoModel():
return $default(_that.firstName,_that.lastName,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'phone_number')  String? phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInfoModel extends UserInfoModel {
  const _UserInfoModel({@JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, @JsonKey(name: 'phone_number') this.phoneNumber}): super._();
  factory _UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);

@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;

/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoModelCopyWith<_UserInfoModel> get copyWith => __$UserInfoModelCopyWithImpl<_UserInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phoneNumber);

@override
String toString() {
  return 'UserInfoModel(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$UserInfoModelCopyWith<$Res> implements $UserInfoModelCopyWith<$Res> {
  factory _$UserInfoModelCopyWith(_UserInfoModel value, $Res Function(_UserInfoModel) _then) = __$UserInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'phone_number') String? phoneNumber
});




}
/// @nodoc
class __$UserInfoModelCopyWithImpl<$Res>
    implements _$UserInfoModelCopyWith<$Res> {
  __$UserInfoModelCopyWithImpl(this._self, this._then);

  final _UserInfoModel _self;
  final $Res Function(_UserInfoModel) _then;

/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? phoneNumber = freezed,}) {
  return _then(_UserInfoModel(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductInfoModel {

 String? get name; String? get category;@JsonKey(name: 'image_urls') List<String>? get imageUrls;
/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<ProductInfoModel> get copyWith => _$ProductInfoModelCopyWithImpl<ProductInfoModel>(this as ProductInfoModel, _$identity);

  /// Serializes this ProductInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,category,const DeepCollectionEquality().hash(imageUrls));

@override
String toString() {
  return 'ProductInfoModel(name: $name, category: $category, imageUrls: $imageUrls)';
}


}

/// @nodoc
abstract mixin class $ProductInfoModelCopyWith<$Res>  {
  factory $ProductInfoModelCopyWith(ProductInfoModel value, $Res Function(ProductInfoModel) _then) = _$ProductInfoModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? category,@JsonKey(name: 'image_urls') List<String>? imageUrls
});




}
/// @nodoc
class _$ProductInfoModelCopyWithImpl<$Res>
    implements $ProductInfoModelCopyWith<$Res> {
  _$ProductInfoModelCopyWithImpl(this._self, this._then);

  final ProductInfoModel _self;
  final $Res Function(ProductInfoModel) _then;

/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? category = freezed,Object? imageUrls = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: freezed == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductInfoModel].
extension ProductInfoModelPatterns on ProductInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? category, @JsonKey(name: 'image_urls')  List<String>? imageUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
return $default(_that.name,_that.category,_that.imageUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? category, @JsonKey(name: 'image_urls')  List<String>? imageUrls)  $default,) {final _that = this;
switch (_that) {
case _ProductInfoModel():
return $default(_that.name,_that.category,_that.imageUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? category, @JsonKey(name: 'image_urls')  List<String>? imageUrls)?  $default,) {final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
return $default(_that.name,_that.category,_that.imageUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductInfoModel extends ProductInfoModel {
  const _ProductInfoModel({this.name, this.category, @JsonKey(name: 'image_urls') final  List<String>? imageUrls}): _imageUrls = imageUrls,super._();
  factory _ProductInfoModel.fromJson(Map<String, dynamic> json) => _$ProductInfoModelFromJson(json);

@override final  String? name;
@override final  String? category;
 final  List<String>? _imageUrls;
@override@JsonKey(name: 'image_urls') List<String>? get imageUrls {
  final value = _imageUrls;
  if (value == null) return null;
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInfoModelCopyWith<_ProductInfoModel> get copyWith => __$ProductInfoModelCopyWithImpl<_ProductInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,category,const DeepCollectionEquality().hash(_imageUrls));

@override
String toString() {
  return 'ProductInfoModel(name: $name, category: $category, imageUrls: $imageUrls)';
}


}

/// @nodoc
abstract mixin class _$ProductInfoModelCopyWith<$Res> implements $ProductInfoModelCopyWith<$Res> {
  factory _$ProductInfoModelCopyWith(_ProductInfoModel value, $Res Function(_ProductInfoModel) _then) = __$ProductInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? category,@JsonKey(name: 'image_urls') List<String>? imageUrls
});




}
/// @nodoc
class __$ProductInfoModelCopyWithImpl<$Res>
    implements _$ProductInfoModelCopyWith<$Res> {
  __$ProductInfoModelCopyWithImpl(this._self, this._then);

  final _ProductInfoModel _self;
  final $Res Function(_ProductInfoModel) _then;

/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? category = freezed,Object? imageUrls = freezed,}) {
  return _then(_ProductInfoModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: freezed == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$CollectorInfoModel {

 String? get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName;@JsonKey(name: 'phone_number') String? get phoneNumber; String? get role;
/// Create a copy of CollectorInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectorInfoModelCopyWith<CollectorInfoModel> get copyWith => _$CollectorInfoModelCopyWithImpl<CollectorInfoModel>(this as CollectorInfoModel, _$identity);

  /// Serializes this CollectorInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectorInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,phoneNumber,role);

@override
String toString() {
  return 'CollectorInfoModel(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, role: $role)';
}


}

/// @nodoc
abstract mixin class $CollectorInfoModelCopyWith<$Res>  {
  factory $CollectorInfoModelCopyWith(CollectorInfoModel value, $Res Function(CollectorInfoModel) _then) = _$CollectorInfoModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'phone_number') String? phoneNumber, String? role
});




}
/// @nodoc
class _$CollectorInfoModelCopyWithImpl<$Res>
    implements $CollectorInfoModelCopyWith<$Res> {
  _$CollectorInfoModelCopyWithImpl(this._self, this._then);

  final CollectorInfoModel _self;
  final $Res Function(CollectorInfoModel) _then;

/// Create a copy of CollectorInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? phoneNumber = freezed,Object? role = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectorInfoModel].
extension CollectorInfoModelPatterns on CollectorInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectorInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectorInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectorInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _CollectorInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectorInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CollectorInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'phone_number')  String? phoneNumber,  String? role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectorInfoModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.phoneNumber,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'phone_number')  String? phoneNumber,  String? role)  $default,) {final _that = this;
switch (_that) {
case _CollectorInfoModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.phoneNumber,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'phone_number')  String? phoneNumber,  String? role)?  $default,) {final _that = this;
switch (_that) {
case _CollectorInfoModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.phoneNumber,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollectorInfoModel extends CollectorInfoModel {
  const _CollectorInfoModel({this.id, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, @JsonKey(name: 'phone_number') this.phoneNumber, this.role}): super._();
  factory _CollectorInfoModel.fromJson(Map<String, dynamic> json) => _$CollectorInfoModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override final  String? role;

/// Create a copy of CollectorInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectorInfoModelCopyWith<_CollectorInfoModel> get copyWith => __$CollectorInfoModelCopyWithImpl<_CollectorInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectorInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectorInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,phoneNumber,role);

@override
String toString() {
  return 'CollectorInfoModel(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, role: $role)';
}


}

/// @nodoc
abstract mixin class _$CollectorInfoModelCopyWith<$Res> implements $CollectorInfoModelCopyWith<$Res> {
  factory _$CollectorInfoModelCopyWith(_CollectorInfoModel value, $Res Function(_CollectorInfoModel) _then) = __$CollectorInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'phone_number') String? phoneNumber, String? role
});




}
/// @nodoc
class __$CollectorInfoModelCopyWithImpl<$Res>
    implements _$CollectorInfoModelCopyWith<$Res> {
  __$CollectorInfoModelCopyWithImpl(this._self, this._then);

  final _CollectorInfoModel _self;
  final $Res Function(_CollectorInfoModel) _then;

/// Create a copy of CollectorInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? phoneNumber = freezed,Object? role = freezed,}) {
  return _then(_CollectorInfoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
