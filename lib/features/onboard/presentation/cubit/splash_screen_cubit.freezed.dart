// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashScreenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashScreenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashScreenState()';
}


}

/// @nodoc
class $SplashScreenStateCopyWith<$Res>  {
$SplashScreenStateCopyWith(SplashScreenState _, $Res Function(SplashScreenState) __);
}


/// Adds pattern-matching-related methods to [SplashScreenState].
extension SplashScreenStatePatterns on SplashScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Onboarding value)?  onboarding,TResult Function( _Auth value)?  auth,TResult Function( _Main value)?  main,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Onboarding() when onboarding != null:
return onboarding(_that);case _Auth() when auth != null:
return auth(_that);case _Main() when main != null:
return main(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Onboarding value)  onboarding,required TResult Function( _Auth value)  auth,required TResult Function( _Main value)  main,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Onboarding():
return onboarding(_that);case _Auth():
return auth(_that);case _Main():
return main(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Onboarding value)?  onboarding,TResult? Function( _Auth value)?  auth,TResult? Function( _Main value)?  main,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Onboarding() when onboarding != null:
return onboarding(_that);case _Auth() when auth != null:
return auth(_that);case _Main() when main != null:
return main(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  onboarding,TResult Function()?  auth,TResult Function()?  main,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Onboarding() when onboarding != null:
return onboarding();case _Auth() when auth != null:
return auth();case _Main() when main != null:
return main();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  onboarding,required TResult Function()  auth,required TResult Function()  main,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Onboarding():
return onboarding();case _Auth():
return auth();case _Main():
return main();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  onboarding,TResult? Function()?  auth,TResult? Function()?  main,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Onboarding() when onboarding != null:
return onboarding();case _Auth() when auth != null:
return auth();case _Main() when main != null:
return main();case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements SplashScreenState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashScreenState.loading()';
}


}




/// @nodoc


class _Onboarding implements SplashScreenState {
  const _Onboarding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Onboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashScreenState.onboarding()';
}


}




/// @nodoc


class _Auth implements SplashScreenState {
  const _Auth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Auth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashScreenState.auth()';
}


}




/// @nodoc


class _Main implements SplashScreenState {
  const _Main();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Main);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashScreenState.main()';
}


}




// dart format on
