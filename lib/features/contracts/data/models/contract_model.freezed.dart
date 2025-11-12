// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractsModel {

 List<ContractGroupModel> get contractGroups;
/// Create a copy of ContractsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractsModelCopyWith<ContractsModel> get copyWith => _$ContractsModelCopyWithImpl<ContractsModel>(this as ContractsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsModel&&const DeepCollectionEquality().equals(other.contractGroups, contractGroups));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contractGroups));

@override
String toString() {
  return 'ContractsModel(contractGroups: $contractGroups)';
}


}

/// @nodoc
abstract mixin class $ContractsModelCopyWith<$Res>  {
  factory $ContractsModelCopyWith(ContractsModel value, $Res Function(ContractsModel) _then) = _$ContractsModelCopyWithImpl;
@useResult
$Res call({
 List<ContractGroupModel> contractGroups
});




}
/// @nodoc
class _$ContractsModelCopyWithImpl<$Res>
    implements $ContractsModelCopyWith<$Res> {
  _$ContractsModelCopyWithImpl(this._self, this._then);

  final ContractsModel _self;
  final $Res Function(ContractsModel) _then;

/// Create a copy of ContractsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contractGroups = null,}) {
  return _then(_self.copyWith(
contractGroups: null == contractGroups ? _self.contractGroups : contractGroups // ignore: cast_nullable_to_non_nullable
as List<ContractGroupModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractsModel].
extension ContractsModelPatterns on ContractsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractsModel value)  $default,){
final _that = this;
switch (_that) {
case _ContractsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContractsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContractGroupModel> contractGroups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractsModel() when $default != null:
return $default(_that.contractGroups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContractGroupModel> contractGroups)  $default,) {final _that = this;
switch (_that) {
case _ContractsModel():
return $default(_that.contractGroups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContractGroupModel> contractGroups)?  $default,) {final _that = this;
switch (_that) {
case _ContractsModel() when $default != null:
return $default(_that.contractGroups);case _:
  return null;

}
}

}

/// @nodoc


class _ContractsModel extends ContractsModel {
  const _ContractsModel({final  List<ContractGroupModel> contractGroups = const []}): _contractGroups = contractGroups,super._();
  

 final  List<ContractGroupModel> _contractGroups;
@override@JsonKey() List<ContractGroupModel> get contractGroups {
  if (_contractGroups is EqualUnmodifiableListView) return _contractGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contractGroups);
}


/// Create a copy of ContractsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractsModelCopyWith<_ContractsModel> get copyWith => __$ContractsModelCopyWithImpl<_ContractsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractsModel&&const DeepCollectionEquality().equals(other._contractGroups, _contractGroups));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contractGroups));

@override
String toString() {
  return 'ContractsModel(contractGroups: $contractGroups)';
}


}

/// @nodoc
abstract mixin class _$ContractsModelCopyWith<$Res> implements $ContractsModelCopyWith<$Res> {
  factory _$ContractsModelCopyWith(_ContractsModel value, $Res Function(_ContractsModel) _then) = __$ContractsModelCopyWithImpl;
@override @useResult
$Res call({
 List<ContractGroupModel> contractGroups
});




}
/// @nodoc
class __$ContractsModelCopyWithImpl<$Res>
    implements _$ContractsModelCopyWith<$Res> {
  __$ContractsModelCopyWithImpl(this._self, this._then);

  final _ContractsModel _self;
  final $Res Function(_ContractsModel) _then;

/// Create a copy of ContractsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contractGroups = null,}) {
  return _then(_ContractsModel(
contractGroups: null == contractGroups ? _self._contractGroups : contractGroups // ignore: cast_nullable_to_non_nullable
as List<ContractGroupModel>,
  ));
}


}

/// @nodoc
mixin _$ContractGroupModel {

 String get date; List<ContractItemModel> get contracts;
/// Create a copy of ContractGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractGroupModelCopyWith<ContractGroupModel> get copyWith => _$ContractGroupModelCopyWithImpl<ContractGroupModel>(this as ContractGroupModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractGroupModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.contracts, contracts));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(contracts));

@override
String toString() {
  return 'ContractGroupModel(date: $date, contracts: $contracts)';
}


}

/// @nodoc
abstract mixin class $ContractGroupModelCopyWith<$Res>  {
  factory $ContractGroupModelCopyWith(ContractGroupModel value, $Res Function(ContractGroupModel) _then) = _$ContractGroupModelCopyWithImpl;
@useResult
$Res call({
 String date, List<ContractItemModel> contracts
});




}
/// @nodoc
class _$ContractGroupModelCopyWithImpl<$Res>
    implements $ContractGroupModelCopyWith<$Res> {
  _$ContractGroupModelCopyWithImpl(this._self, this._then);

  final ContractGroupModel _self;
  final $Res Function(ContractGroupModel) _then;

/// Create a copy of ContractGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? contracts = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,contracts: null == contracts ? _self.contracts : contracts // ignore: cast_nullable_to_non_nullable
as List<ContractItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractGroupModel].
extension ContractGroupModelPatterns on ContractGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _ContractGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContractGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  List<ContractItemModel> contracts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractGroupModel() when $default != null:
return $default(_that.date,_that.contracts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  List<ContractItemModel> contracts)  $default,) {final _that = this;
switch (_that) {
case _ContractGroupModel():
return $default(_that.date,_that.contracts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  List<ContractItemModel> contracts)?  $default,) {final _that = this;
switch (_that) {
case _ContractGroupModel() when $default != null:
return $default(_that.date,_that.contracts);case _:
  return null;

}
}

}

/// @nodoc


class _ContractGroupModel extends ContractGroupModel {
  const _ContractGroupModel({required this.date, final  List<ContractItemModel> contracts = const []}): _contracts = contracts,super._();
  

@override final  String date;
 final  List<ContractItemModel> _contracts;
@override@JsonKey() List<ContractItemModel> get contracts {
  if (_contracts is EqualUnmodifiableListView) return _contracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contracts);
}


/// Create a copy of ContractGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractGroupModelCopyWith<_ContractGroupModel> get copyWith => __$ContractGroupModelCopyWithImpl<_ContractGroupModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractGroupModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._contracts, _contracts));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_contracts));

@override
String toString() {
  return 'ContractGroupModel(date: $date, contracts: $contracts)';
}


}

/// @nodoc
abstract mixin class _$ContractGroupModelCopyWith<$Res> implements $ContractGroupModelCopyWith<$Res> {
  factory _$ContractGroupModelCopyWith(_ContractGroupModel value, $Res Function(_ContractGroupModel) _then) = __$ContractGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String date, List<ContractItemModel> contracts
});




}
/// @nodoc
class __$ContractGroupModelCopyWithImpl<$Res>
    implements _$ContractGroupModelCopyWith<$Res> {
  __$ContractGroupModelCopyWithImpl(this._self, this._then);

  final _ContractGroupModel _self;
  final $Res Function(_ContractGroupModel) _then;

/// Create a copy of ContractGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? contracts = null,}) {
  return _then(_ContractGroupModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,contracts: null == contracts ? _self._contracts : contracts // ignore: cast_nullable_to_non_nullable
as List<ContractItemModel>,
  ));
}


}

/// @nodoc
mixin _$ContractItemModel {

 int get id; String get vehicleName; String get clientName; String get clientId; String? get status; String? get vehicleImage;
/// Create a copy of ContractItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractItemModelCopyWith<ContractItemModel> get copyWith => _$ContractItemModelCopyWithImpl<ContractItemModel>(this as ContractItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.status, status) || other.status == status)&&(identical(other.vehicleImage, vehicleImage) || other.vehicleImage == vehicleImage));
}


@override
int get hashCode => Object.hash(runtimeType,id,vehicleName,clientName,clientId,status,vehicleImage);

@override
String toString() {
  return 'ContractItemModel(id: $id, vehicleName: $vehicleName, clientName: $clientName, clientId: $clientId, status: $status, vehicleImage: $vehicleImage)';
}


}

/// @nodoc
abstract mixin class $ContractItemModelCopyWith<$Res>  {
  factory $ContractItemModelCopyWith(ContractItemModel value, $Res Function(ContractItemModel) _then) = _$ContractItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String vehicleName, String clientName, String clientId, String? status, String? vehicleImage
});




}
/// @nodoc
class _$ContractItemModelCopyWithImpl<$Res>
    implements $ContractItemModelCopyWith<$Res> {
  _$ContractItemModelCopyWithImpl(this._self, this._then);

  final ContractItemModel _self;
  final $Res Function(ContractItemModel) _then;

/// Create a copy of ContractItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleName = null,Object? clientName = null,Object? clientId = null,Object? status = freezed,Object? vehicleImage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vehicleName: null == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,vehicleImage: freezed == vehicleImage ? _self.vehicleImage : vehicleImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractItemModel].
extension ContractItemModelPatterns on ContractItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ContractItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContractItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String vehicleName,  String clientName,  String clientId,  String? status,  String? vehicleImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractItemModel() when $default != null:
return $default(_that.id,_that.vehicleName,_that.clientName,_that.clientId,_that.status,_that.vehicleImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String vehicleName,  String clientName,  String clientId,  String? status,  String? vehicleImage)  $default,) {final _that = this;
switch (_that) {
case _ContractItemModel():
return $default(_that.id,_that.vehicleName,_that.clientName,_that.clientId,_that.status,_that.vehicleImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String vehicleName,  String clientName,  String clientId,  String? status,  String? vehicleImage)?  $default,) {final _that = this;
switch (_that) {
case _ContractItemModel() when $default != null:
return $default(_that.id,_that.vehicleName,_that.clientName,_that.clientId,_that.status,_that.vehicleImage);case _:
  return null;

}
}

}

/// @nodoc


class _ContractItemModel extends ContractItemModel {
  const _ContractItemModel({required this.id, required this.vehicleName, required this.clientName, required this.clientId, this.status, this.vehicleImage}): super._();
  

@override final  int id;
@override final  String vehicleName;
@override final  String clientName;
@override final  String clientId;
@override final  String? status;
@override final  String? vehicleImage;

/// Create a copy of ContractItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractItemModelCopyWith<_ContractItemModel> get copyWith => __$ContractItemModelCopyWithImpl<_ContractItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.status, status) || other.status == status)&&(identical(other.vehicleImage, vehicleImage) || other.vehicleImage == vehicleImage));
}


@override
int get hashCode => Object.hash(runtimeType,id,vehicleName,clientName,clientId,status,vehicleImage);

@override
String toString() {
  return 'ContractItemModel(id: $id, vehicleName: $vehicleName, clientName: $clientName, clientId: $clientId, status: $status, vehicleImage: $vehicleImage)';
}


}

/// @nodoc
abstract mixin class _$ContractItemModelCopyWith<$Res> implements $ContractItemModelCopyWith<$Res> {
  factory _$ContractItemModelCopyWith(_ContractItemModel value, $Res Function(_ContractItemModel) _then) = __$ContractItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String vehicleName, String clientName, String clientId, String? status, String? vehicleImage
});




}
/// @nodoc
class __$ContractItemModelCopyWithImpl<$Res>
    implements _$ContractItemModelCopyWith<$Res> {
  __$ContractItemModelCopyWithImpl(this._self, this._then);

  final _ContractItemModel _self;
  final $Res Function(_ContractItemModel) _then;

/// Create a copy of ContractItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleName = null,Object? clientName = null,Object? clientId = null,Object? status = freezed,Object? vehicleImage = freezed,}) {
  return _then(_ContractItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vehicleName: null == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,vehicleImage: freezed == vehicleImage ? _self.vehicleImage : vehicleImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
