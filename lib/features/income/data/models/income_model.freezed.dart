// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeSourcesModel {

 List<IncomeSourceModel> get collectors; List<IncomeSourceModel> get customers; List<IncomeSourceModel> get investors; String? get month;
/// Create a copy of IncomeSourcesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeSourcesModelCopyWith<IncomeSourcesModel> get copyWith => _$IncomeSourcesModelCopyWithImpl<IncomeSourcesModel>(this as IncomeSourcesModel, _$identity);

  /// Serializes this IncomeSourcesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeSourcesModel&&const DeepCollectionEquality().equals(other.collectors, collectors)&&const DeepCollectionEquality().equals(other.customers, customers)&&const DeepCollectionEquality().equals(other.investors, investors)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(collectors),const DeepCollectionEquality().hash(customers),const DeepCollectionEquality().hash(investors),month);

@override
String toString() {
  return 'IncomeSourcesModel(collectors: $collectors, customers: $customers, investors: $investors, month: $month)';
}


}

/// @nodoc
abstract mixin class $IncomeSourcesModelCopyWith<$Res>  {
  factory $IncomeSourcesModelCopyWith(IncomeSourcesModel value, $Res Function(IncomeSourcesModel) _then) = _$IncomeSourcesModelCopyWithImpl;
@useResult
$Res call({
 List<IncomeSourceModel> collectors, List<IncomeSourceModel> customers, List<IncomeSourceModel> investors, String? month
});




}
/// @nodoc
class _$IncomeSourcesModelCopyWithImpl<$Res>
    implements $IncomeSourcesModelCopyWith<$Res> {
  _$IncomeSourcesModelCopyWithImpl(this._self, this._then);

  final IncomeSourcesModel _self;
  final $Res Function(IncomeSourcesModel) _then;

/// Create a copy of IncomeSourcesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collectors = null,Object? customers = null,Object? investors = null,Object? month = freezed,}) {
  return _then(_self.copyWith(
collectors: null == collectors ? _self.collectors : collectors // ignore: cast_nullable_to_non_nullable
as List<IncomeSourceModel>,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as List<IncomeSourceModel>,investors: null == investors ? _self.investors : investors // ignore: cast_nullable_to_non_nullable
as List<IncomeSourceModel>,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeSourcesModel].
extension IncomeSourcesModelPatterns on IncomeSourcesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeSourcesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeSourcesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeSourcesModel value)  $default,){
final _that = this;
switch (_that) {
case _IncomeSourcesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeSourcesModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeSourcesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IncomeSourceModel> collectors,  List<IncomeSourceModel> customers,  List<IncomeSourceModel> investors,  String? month)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeSourcesModel() when $default != null:
return $default(_that.collectors,_that.customers,_that.investors,_that.month);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IncomeSourceModel> collectors,  List<IncomeSourceModel> customers,  List<IncomeSourceModel> investors,  String? month)  $default,) {final _that = this;
switch (_that) {
case _IncomeSourcesModel():
return $default(_that.collectors,_that.customers,_that.investors,_that.month);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IncomeSourceModel> collectors,  List<IncomeSourceModel> customers,  List<IncomeSourceModel> investors,  String? month)?  $default,) {final _that = this;
switch (_that) {
case _IncomeSourcesModel() when $default != null:
return $default(_that.collectors,_that.customers,_that.investors,_that.month);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeSourcesModel extends IncomeSourcesModel {
  const _IncomeSourcesModel({final  List<IncomeSourceModel> collectors = const [], final  List<IncomeSourceModel> customers = const [], final  List<IncomeSourceModel> investors = const [], this.month}): _collectors = collectors,_customers = customers,_investors = investors,super._();
  factory _IncomeSourcesModel.fromJson(Map<String, dynamic> json) => _$IncomeSourcesModelFromJson(json);

 final  List<IncomeSourceModel> _collectors;
@override@JsonKey() List<IncomeSourceModel> get collectors {
  if (_collectors is EqualUnmodifiableListView) return _collectors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collectors);
}

 final  List<IncomeSourceModel> _customers;
@override@JsonKey() List<IncomeSourceModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

 final  List<IncomeSourceModel> _investors;
@override@JsonKey() List<IncomeSourceModel> get investors {
  if (_investors is EqualUnmodifiableListView) return _investors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_investors);
}

@override final  String? month;

/// Create a copy of IncomeSourcesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeSourcesModelCopyWith<_IncomeSourcesModel> get copyWith => __$IncomeSourcesModelCopyWithImpl<_IncomeSourcesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeSourcesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeSourcesModel&&const DeepCollectionEquality().equals(other._collectors, _collectors)&&const DeepCollectionEquality().equals(other._customers, _customers)&&const DeepCollectionEquality().equals(other._investors, _investors)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_collectors),const DeepCollectionEquality().hash(_customers),const DeepCollectionEquality().hash(_investors),month);

@override
String toString() {
  return 'IncomeSourcesModel(collectors: $collectors, customers: $customers, investors: $investors, month: $month)';
}


}

/// @nodoc
abstract mixin class _$IncomeSourcesModelCopyWith<$Res> implements $IncomeSourcesModelCopyWith<$Res> {
  factory _$IncomeSourcesModelCopyWith(_IncomeSourcesModel value, $Res Function(_IncomeSourcesModel) _then) = __$IncomeSourcesModelCopyWithImpl;
@override @useResult
$Res call({
 List<IncomeSourceModel> collectors, List<IncomeSourceModel> customers, List<IncomeSourceModel> investors, String? month
});




}
/// @nodoc
class __$IncomeSourcesModelCopyWithImpl<$Res>
    implements _$IncomeSourcesModelCopyWith<$Res> {
  __$IncomeSourcesModelCopyWithImpl(this._self, this._then);

  final _IncomeSourcesModel _self;
  final $Res Function(_IncomeSourcesModel) _then;

/// Create a copy of IncomeSourcesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collectors = null,Object? customers = null,Object? investors = null,Object? month = freezed,}) {
  return _then(_IncomeSourcesModel(
collectors: null == collectors ? _self._collectors : collectors // ignore: cast_nullable_to_non_nullable
as List<IncomeSourceModel>,customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<IncomeSourceModel>,investors: null == investors ? _self._investors : investors // ignore: cast_nullable_to_non_nullable
as List<IncomeSourceModel>,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$IncomeSourceModel {

@JsonKey(name: 'source_type') String? get sourceType;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'monthly_total') double get monthlyTotal;@JsonKey(name: 'pending_count') int get pendingCount;
/// Create a copy of IncomeSourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeSourceModelCopyWith<IncomeSourceModel> get copyWith => _$IncomeSourceModelCopyWithImpl<IncomeSourceModel>(this as IncomeSourceModel, _$identity);

  /// Serializes this IncomeSourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeSourceModel&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.monthlyTotal, monthlyTotal) || other.monthlyTotal == monthlyTotal)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceType,userId,fullName,phoneNumber,monthlyTotal,pendingCount);

@override
String toString() {
  return 'IncomeSourceModel(sourceType: $sourceType, userId: $userId, fullName: $fullName, phoneNumber: $phoneNumber, monthlyTotal: $monthlyTotal, pendingCount: $pendingCount)';
}


}

/// @nodoc
abstract mixin class $IncomeSourceModelCopyWith<$Res>  {
  factory $IncomeSourceModelCopyWith(IncomeSourceModel value, $Res Function(IncomeSourceModel) _then) = _$IncomeSourceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'source_type') String? sourceType,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'monthly_total') double monthlyTotal,@JsonKey(name: 'pending_count') int pendingCount
});




}
/// @nodoc
class _$IncomeSourceModelCopyWithImpl<$Res>
    implements $IncomeSourceModelCopyWith<$Res> {
  _$IncomeSourceModelCopyWithImpl(this._self, this._then);

  final IncomeSourceModel _self;
  final $Res Function(IncomeSourceModel) _then;

/// Create a copy of IncomeSourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceType = freezed,Object? userId = freezed,Object? fullName = null,Object? phoneNumber = freezed,Object? monthlyTotal = null,Object? pendingCount = null,}) {
  return _then(_self.copyWith(
sourceType: freezed == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,monthlyTotal: null == monthlyTotal ? _self.monthlyTotal : monthlyTotal // ignore: cast_nullable_to_non_nullable
as double,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeSourceModel].
extension IncomeSourceModelPatterns on IncomeSourceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeSourceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeSourceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeSourceModel value)  $default,){
final _that = this;
switch (_that) {
case _IncomeSourceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeSourceModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeSourceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_type')  String? sourceType, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'monthly_total')  double monthlyTotal, @JsonKey(name: 'pending_count')  int pendingCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeSourceModel() when $default != null:
return $default(_that.sourceType,_that.userId,_that.fullName,_that.phoneNumber,_that.monthlyTotal,_that.pendingCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_type')  String? sourceType, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'monthly_total')  double monthlyTotal, @JsonKey(name: 'pending_count')  int pendingCount)  $default,) {final _that = this;
switch (_that) {
case _IncomeSourceModel():
return $default(_that.sourceType,_that.userId,_that.fullName,_that.phoneNumber,_that.monthlyTotal,_that.pendingCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'source_type')  String? sourceType, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'monthly_total')  double monthlyTotal, @JsonKey(name: 'pending_count')  int pendingCount)?  $default,) {final _that = this;
switch (_that) {
case _IncomeSourceModel() when $default != null:
return $default(_that.sourceType,_that.userId,_that.fullName,_that.phoneNumber,_that.monthlyTotal,_that.pendingCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeSourceModel extends IncomeSourceModel {
  const _IncomeSourceModel({@JsonKey(name: 'source_type') this.sourceType, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'full_name') this.fullName = '', @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'monthly_total') this.monthlyTotal = 0.0, @JsonKey(name: 'pending_count') this.pendingCount = 0}): super._();
  factory _IncomeSourceModel.fromJson(Map<String, dynamic> json) => _$IncomeSourceModelFromJson(json);

@override@JsonKey(name: 'source_type') final  String? sourceType;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'monthly_total') final  double monthlyTotal;
@override@JsonKey(name: 'pending_count') final  int pendingCount;

/// Create a copy of IncomeSourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeSourceModelCopyWith<_IncomeSourceModel> get copyWith => __$IncomeSourceModelCopyWithImpl<_IncomeSourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeSourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeSourceModel&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.monthlyTotal, monthlyTotal) || other.monthlyTotal == monthlyTotal)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceType,userId,fullName,phoneNumber,monthlyTotal,pendingCount);

@override
String toString() {
  return 'IncomeSourceModel(sourceType: $sourceType, userId: $userId, fullName: $fullName, phoneNumber: $phoneNumber, monthlyTotal: $monthlyTotal, pendingCount: $pendingCount)';
}


}

/// @nodoc
abstract mixin class _$IncomeSourceModelCopyWith<$Res> implements $IncomeSourceModelCopyWith<$Res> {
  factory _$IncomeSourceModelCopyWith(_IncomeSourceModel value, $Res Function(_IncomeSourceModel) _then) = __$IncomeSourceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'source_type') String? sourceType,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'monthly_total') double monthlyTotal,@JsonKey(name: 'pending_count') int pendingCount
});




}
/// @nodoc
class __$IncomeSourceModelCopyWithImpl<$Res>
    implements _$IncomeSourceModelCopyWith<$Res> {
  __$IncomeSourceModelCopyWithImpl(this._self, this._then);

  final _IncomeSourceModel _self;
  final $Res Function(_IncomeSourceModel) _then;

/// Create a copy of IncomeSourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceType = freezed,Object? userId = freezed,Object? fullName = null,Object? phoneNumber = freezed,Object? monthlyTotal = null,Object? pendingCount = null,}) {
  return _then(_IncomeSourceModel(
sourceType: freezed == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,monthlyTotal: null == monthlyTotal ? _self.monthlyTotal : monthlyTotal // ignore: cast_nullable_to_non_nullable
as double,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
