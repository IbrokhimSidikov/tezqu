// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBalanceModel {

 UserBalanceUserModel get user; BalanceDetailsModel get balance;
/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBalanceModelCopyWith<UserBalanceModel> get copyWith => _$UserBalanceModelCopyWithImpl<UserBalanceModel>(this as UserBalanceModel, _$identity);

  /// Serializes this UserBalanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBalanceModel&&(identical(other.user, user) || other.user == user)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,balance);

@override
String toString() {
  return 'UserBalanceModel(user: $user, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $UserBalanceModelCopyWith<$Res>  {
  factory $UserBalanceModelCopyWith(UserBalanceModel value, $Res Function(UserBalanceModel) _then) = _$UserBalanceModelCopyWithImpl;
@useResult
$Res call({
 UserBalanceUserModel user, BalanceDetailsModel balance
});


$UserBalanceUserModelCopyWith<$Res> get user;$BalanceDetailsModelCopyWith<$Res> get balance;

}
/// @nodoc
class _$UserBalanceModelCopyWithImpl<$Res>
    implements $UserBalanceModelCopyWith<$Res> {
  _$UserBalanceModelCopyWithImpl(this._self, this._then);

  final UserBalanceModel _self;
  final $Res Function(UserBalanceModel) _then;

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? balance = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserBalanceUserModel,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as BalanceDetailsModel,
  ));
}
/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserBalanceUserModelCopyWith<$Res> get user {
  
  return $UserBalanceUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceDetailsModelCopyWith<$Res> get balance {
  
  return $BalanceDetailsModelCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserBalanceModel].
extension UserBalanceModelPatterns on UserBalanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBalanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBalanceModel value)  $default,){
final _that = this;
switch (_that) {
case _UserBalanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBalanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserBalanceUserModel user,  BalanceDetailsModel balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
return $default(_that.user,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserBalanceUserModel user,  BalanceDetailsModel balance)  $default,) {final _that = this;
switch (_that) {
case _UserBalanceModel():
return $default(_that.user,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserBalanceUserModel user,  BalanceDetailsModel balance)?  $default,) {final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
return $default(_that.user,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBalanceModel extends UserBalanceModel {
  const _UserBalanceModel({required this.user, required this.balance}): super._();
  factory _UserBalanceModel.fromJson(Map<String, dynamic> json) => _$UserBalanceModelFromJson(json);

@override final  UserBalanceUserModel user;
@override final  BalanceDetailsModel balance;

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBalanceModelCopyWith<_UserBalanceModel> get copyWith => __$UserBalanceModelCopyWithImpl<_UserBalanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBalanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBalanceModel&&(identical(other.user, user) || other.user == user)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,balance);

@override
String toString() {
  return 'UserBalanceModel(user: $user, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$UserBalanceModelCopyWith<$Res> implements $UserBalanceModelCopyWith<$Res> {
  factory _$UserBalanceModelCopyWith(_UserBalanceModel value, $Res Function(_UserBalanceModel) _then) = __$UserBalanceModelCopyWithImpl;
@override @useResult
$Res call({
 UserBalanceUserModel user, BalanceDetailsModel balance
});


@override $UserBalanceUserModelCopyWith<$Res> get user;@override $BalanceDetailsModelCopyWith<$Res> get balance;

}
/// @nodoc
class __$UserBalanceModelCopyWithImpl<$Res>
    implements _$UserBalanceModelCopyWith<$Res> {
  __$UserBalanceModelCopyWithImpl(this._self, this._then);

  final _UserBalanceModel _self;
  final $Res Function(_UserBalanceModel) _then;

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? balance = null,}) {
  return _then(_UserBalanceModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserBalanceUserModel,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as BalanceDetailsModel,
  ));
}

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserBalanceUserModelCopyWith<$Res> get user {
  
  return $UserBalanceUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BalanceDetailsModelCopyWith<$Res> get balance {
  
  return $BalanceDetailsModelCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}


/// @nodoc
mixin _$UserBalanceUserModel {

 String get id;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'phone_number') String get phoneNumber; String get role;
/// Create a copy of UserBalanceUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBalanceUserModelCopyWith<UserBalanceUserModel> get copyWith => _$UserBalanceUserModelCopyWithImpl<UserBalanceUserModel>(this as UserBalanceUserModel, _$identity);

  /// Serializes this UserBalanceUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBalanceUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,phoneNumber,role);

@override
String toString() {
  return 'UserBalanceUserModel(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserBalanceUserModelCopyWith<$Res>  {
  factory $UserBalanceUserModelCopyWith(UserBalanceUserModel value, $Res Function(UserBalanceUserModel) _then) = _$UserBalanceUserModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'phone_number') String phoneNumber, String role
});




}
/// @nodoc
class _$UserBalanceUserModelCopyWithImpl<$Res>
    implements $UserBalanceUserModelCopyWith<$Res> {
  _$UserBalanceUserModelCopyWithImpl(this._self, this._then);

  final UserBalanceUserModel _self;
  final $Res Function(UserBalanceUserModel) _then;

/// Create a copy of UserBalanceUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? phoneNumber = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBalanceUserModel].
extension UserBalanceUserModelPatterns on UserBalanceUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBalanceUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBalanceUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBalanceUserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserBalanceUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBalanceUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserBalanceUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'phone_number')  String phoneNumber,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBalanceUserModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'phone_number')  String phoneNumber,  String role)  $default,) {final _that = this;
switch (_that) {
case _UserBalanceUserModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'phone_number')  String phoneNumber,  String role)?  $default,) {final _that = this;
switch (_that) {
case _UserBalanceUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.phoneNumber,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBalanceUserModel implements UserBalanceUserModel {
  const _UserBalanceUserModel({required this.id, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'phone_number') required this.phoneNumber, required this.role});
  factory _UserBalanceUserModel.fromJson(Map<String, dynamic> json) => _$UserBalanceUserModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override final  String role;

/// Create a copy of UserBalanceUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBalanceUserModelCopyWith<_UserBalanceUserModel> get copyWith => __$UserBalanceUserModelCopyWithImpl<_UserBalanceUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBalanceUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBalanceUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,phoneNumber,role);

@override
String toString() {
  return 'UserBalanceUserModel(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserBalanceUserModelCopyWith<$Res> implements $UserBalanceUserModelCopyWith<$Res> {
  factory _$UserBalanceUserModelCopyWith(_UserBalanceUserModel value, $Res Function(_UserBalanceUserModel) _then) = __$UserBalanceUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'phone_number') String phoneNumber, String role
});




}
/// @nodoc
class __$UserBalanceUserModelCopyWithImpl<$Res>
    implements _$UserBalanceUserModelCopyWith<$Res> {
  __$UserBalanceUserModelCopyWithImpl(this._self, this._then);

  final _UserBalanceUserModel _self;
  final $Res Function(_UserBalanceUserModel) _then;

/// Create a copy of UserBalanceUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? phoneNumber = null,Object? role = null,}) {
  return _then(_UserBalanceUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BalanceDetailsModel {

@JsonKey(fromJson: _toDouble) double get balance;@JsonKey(name: 'total_debt', fromJson: _toDouble) double get totalDebt;@JsonKey(name: 'total_paid', fromJson: _toDouble) double get totalPaid;@JsonKey(name: 'total_investment', fromJson: _toDouble) double get totalInvestment;@JsonKey(name: 'total_payable', fromJson: _toDouble) double get totalPayable;@JsonKey(name: 'pending_collections', fromJson: _toDouble) double get pendingCollections;
/// Create a copy of BalanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceDetailsModelCopyWith<BalanceDetailsModel> get copyWith => _$BalanceDetailsModelCopyWithImpl<BalanceDetailsModel>(this as BalanceDetailsModel, _$identity);

  /// Serializes this BalanceDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BalanceDetailsModel&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.totalDebt, totalDebt) || other.totalDebt == totalDebt)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalInvestment, totalInvestment) || other.totalInvestment == totalInvestment)&&(identical(other.totalPayable, totalPayable) || other.totalPayable == totalPayable)&&(identical(other.pendingCollections, pendingCollections) || other.pendingCollections == pendingCollections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balance,totalDebt,totalPaid,totalInvestment,totalPayable,pendingCollections);

@override
String toString() {
  return 'BalanceDetailsModel(balance: $balance, totalDebt: $totalDebt, totalPaid: $totalPaid, totalInvestment: $totalInvestment, totalPayable: $totalPayable, pendingCollections: $pendingCollections)';
}


}

/// @nodoc
abstract mixin class $BalanceDetailsModelCopyWith<$Res>  {
  factory $BalanceDetailsModelCopyWith(BalanceDetailsModel value, $Res Function(BalanceDetailsModel) _then) = _$BalanceDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toDouble) double balance,@JsonKey(name: 'total_debt', fromJson: _toDouble) double totalDebt,@JsonKey(name: 'total_paid', fromJson: _toDouble) double totalPaid,@JsonKey(name: 'total_investment', fromJson: _toDouble) double totalInvestment,@JsonKey(name: 'total_payable', fromJson: _toDouble) double totalPayable,@JsonKey(name: 'pending_collections', fromJson: _toDouble) double pendingCollections
});




}
/// @nodoc
class _$BalanceDetailsModelCopyWithImpl<$Res>
    implements $BalanceDetailsModelCopyWith<$Res> {
  _$BalanceDetailsModelCopyWithImpl(this._self, this._then);

  final BalanceDetailsModel _self;
  final $Res Function(BalanceDetailsModel) _then;

/// Create a copy of BalanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? totalDebt = null,Object? totalPaid = null,Object? totalInvestment = null,Object? totalPayable = null,Object? pendingCollections = null,}) {
  return _then(_self.copyWith(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,totalDebt: null == totalDebt ? _self.totalDebt : totalDebt // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalInvestment: null == totalInvestment ? _self.totalInvestment : totalInvestment // ignore: cast_nullable_to_non_nullable
as double,totalPayable: null == totalPayable ? _self.totalPayable : totalPayable // ignore: cast_nullable_to_non_nullable
as double,pendingCollections: null == pendingCollections ? _self.pendingCollections : pendingCollections // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BalanceDetailsModel].
extension BalanceDetailsModelPatterns on BalanceDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BalanceDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BalanceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BalanceDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _BalanceDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BalanceDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _BalanceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toDouble)  double balance, @JsonKey(name: 'total_debt', fromJson: _toDouble)  double totalDebt, @JsonKey(name: 'total_paid', fromJson: _toDouble)  double totalPaid, @JsonKey(name: 'total_investment', fromJson: _toDouble)  double totalInvestment, @JsonKey(name: 'total_payable', fromJson: _toDouble)  double totalPayable, @JsonKey(name: 'pending_collections', fromJson: _toDouble)  double pendingCollections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BalanceDetailsModel() when $default != null:
return $default(_that.balance,_that.totalDebt,_that.totalPaid,_that.totalInvestment,_that.totalPayable,_that.pendingCollections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toDouble)  double balance, @JsonKey(name: 'total_debt', fromJson: _toDouble)  double totalDebt, @JsonKey(name: 'total_paid', fromJson: _toDouble)  double totalPaid, @JsonKey(name: 'total_investment', fromJson: _toDouble)  double totalInvestment, @JsonKey(name: 'total_payable', fromJson: _toDouble)  double totalPayable, @JsonKey(name: 'pending_collections', fromJson: _toDouble)  double pendingCollections)  $default,) {final _that = this;
switch (_that) {
case _BalanceDetailsModel():
return $default(_that.balance,_that.totalDebt,_that.totalPaid,_that.totalInvestment,_that.totalPayable,_that.pendingCollections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toDouble)  double balance, @JsonKey(name: 'total_debt', fromJson: _toDouble)  double totalDebt, @JsonKey(name: 'total_paid', fromJson: _toDouble)  double totalPaid, @JsonKey(name: 'total_investment', fromJson: _toDouble)  double totalInvestment, @JsonKey(name: 'total_payable', fromJson: _toDouble)  double totalPayable, @JsonKey(name: 'pending_collections', fromJson: _toDouble)  double pendingCollections)?  $default,) {final _that = this;
switch (_that) {
case _BalanceDetailsModel() when $default != null:
return $default(_that.balance,_that.totalDebt,_that.totalPaid,_that.totalInvestment,_that.totalPayable,_that.pendingCollections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BalanceDetailsModel implements BalanceDetailsModel {
  const _BalanceDetailsModel({@JsonKey(fromJson: _toDouble) this.balance = 0.0, @JsonKey(name: 'total_debt', fromJson: _toDouble) this.totalDebt = 0.0, @JsonKey(name: 'total_paid', fromJson: _toDouble) this.totalPaid = 0.0, @JsonKey(name: 'total_investment', fromJson: _toDouble) this.totalInvestment = 0.0, @JsonKey(name: 'total_payable', fromJson: _toDouble) this.totalPayable = 0.0, @JsonKey(name: 'pending_collections', fromJson: _toDouble) this.pendingCollections = 0.0});
  factory _BalanceDetailsModel.fromJson(Map<String, dynamic> json) => _$BalanceDetailsModelFromJson(json);

@override@JsonKey(fromJson: _toDouble) final  double balance;
@override@JsonKey(name: 'total_debt', fromJson: _toDouble) final  double totalDebt;
@override@JsonKey(name: 'total_paid', fromJson: _toDouble) final  double totalPaid;
@override@JsonKey(name: 'total_investment', fromJson: _toDouble) final  double totalInvestment;
@override@JsonKey(name: 'total_payable', fromJson: _toDouble) final  double totalPayable;
@override@JsonKey(name: 'pending_collections', fromJson: _toDouble) final  double pendingCollections;

/// Create a copy of BalanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceDetailsModelCopyWith<_BalanceDetailsModel> get copyWith => __$BalanceDetailsModelCopyWithImpl<_BalanceDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BalanceDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BalanceDetailsModel&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.totalDebt, totalDebt) || other.totalDebt == totalDebt)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalInvestment, totalInvestment) || other.totalInvestment == totalInvestment)&&(identical(other.totalPayable, totalPayable) || other.totalPayable == totalPayable)&&(identical(other.pendingCollections, pendingCollections) || other.pendingCollections == pendingCollections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balance,totalDebt,totalPaid,totalInvestment,totalPayable,pendingCollections);

@override
String toString() {
  return 'BalanceDetailsModel(balance: $balance, totalDebt: $totalDebt, totalPaid: $totalPaid, totalInvestment: $totalInvestment, totalPayable: $totalPayable, pendingCollections: $pendingCollections)';
}


}

/// @nodoc
abstract mixin class _$BalanceDetailsModelCopyWith<$Res> implements $BalanceDetailsModelCopyWith<$Res> {
  factory _$BalanceDetailsModelCopyWith(_BalanceDetailsModel value, $Res Function(_BalanceDetailsModel) _then) = __$BalanceDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toDouble) double balance,@JsonKey(name: 'total_debt', fromJson: _toDouble) double totalDebt,@JsonKey(name: 'total_paid', fromJson: _toDouble) double totalPaid,@JsonKey(name: 'total_investment', fromJson: _toDouble) double totalInvestment,@JsonKey(name: 'total_payable', fromJson: _toDouble) double totalPayable,@JsonKey(name: 'pending_collections', fromJson: _toDouble) double pendingCollections
});




}
/// @nodoc
class __$BalanceDetailsModelCopyWithImpl<$Res>
    implements _$BalanceDetailsModelCopyWith<$Res> {
  __$BalanceDetailsModelCopyWithImpl(this._self, this._then);

  final _BalanceDetailsModel _self;
  final $Res Function(_BalanceDetailsModel) _then;

/// Create a copy of BalanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? totalDebt = null,Object? totalPaid = null,Object? totalInvestment = null,Object? totalPayable = null,Object? pendingCollections = null,}) {
  return _then(_BalanceDetailsModel(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,totalDebt: null == totalDebt ? _self.totalDebt : totalDebt // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalInvestment: null == totalInvestment ? _self.totalInvestment : totalInvestment // ignore: cast_nullable_to_non_nullable
as double,totalPayable: null == totalPayable ? _self.totalPayable : totalPayable // ignore: cast_nullable_to_non_nullable
as double,pendingCollections: null == pendingCollections ? _self.pendingCollections : pendingCollections // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
