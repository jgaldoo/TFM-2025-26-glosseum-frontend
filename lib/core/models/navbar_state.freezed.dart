// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navbar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavbarState {

 bool get showTopNavbar; List<NavEntry> get topNavLeftEntries; List<NavEntry> get topNavRightEntries; bool get showBottomNavbar; List<NavEntry> get bottomNavEntries;
/// Create a copy of NavbarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavbarStateCopyWith<NavbarState> get copyWith => _$NavbarStateCopyWithImpl<NavbarState>(this as NavbarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavbarState&&(identical(other.showTopNavbar, showTopNavbar) || other.showTopNavbar == showTopNavbar)&&const DeepCollectionEquality().equals(other.topNavLeftEntries, topNavLeftEntries)&&const DeepCollectionEquality().equals(other.topNavRightEntries, topNavRightEntries)&&(identical(other.showBottomNavbar, showBottomNavbar) || other.showBottomNavbar == showBottomNavbar)&&const DeepCollectionEquality().equals(other.bottomNavEntries, bottomNavEntries));
}


@override
int get hashCode => Object.hash(runtimeType,showTopNavbar,const DeepCollectionEquality().hash(topNavLeftEntries),const DeepCollectionEquality().hash(topNavRightEntries),showBottomNavbar,const DeepCollectionEquality().hash(bottomNavEntries));

@override
String toString() {
  return 'NavbarState(showTopNavbar: $showTopNavbar, topNavLeftEntries: $topNavLeftEntries, topNavRightEntries: $topNavRightEntries, showBottomNavbar: $showBottomNavbar, bottomNavEntries: $bottomNavEntries)';
}


}

/// @nodoc
abstract mixin class $NavbarStateCopyWith<$Res>  {
  factory $NavbarStateCopyWith(NavbarState value, $Res Function(NavbarState) _then) = _$NavbarStateCopyWithImpl;
@useResult
$Res call({
 bool showTopNavbar, List<NavEntry> topNavLeftEntries, List<NavEntry> topNavRightEntries, bool showBottomNavbar, List<NavEntry> bottomNavEntries
});




}
/// @nodoc
class _$NavbarStateCopyWithImpl<$Res>
    implements $NavbarStateCopyWith<$Res> {
  _$NavbarStateCopyWithImpl(this._self, this._then);

  final NavbarState _self;
  final $Res Function(NavbarState) _then;

/// Create a copy of NavbarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showTopNavbar = null,Object? topNavLeftEntries = null,Object? topNavRightEntries = null,Object? showBottomNavbar = null,Object? bottomNavEntries = null,}) {
  return _then(_self.copyWith(
showTopNavbar: null == showTopNavbar ? _self.showTopNavbar : showTopNavbar // ignore: cast_nullable_to_non_nullable
as bool,topNavLeftEntries: null == topNavLeftEntries ? _self.topNavLeftEntries : topNavLeftEntries // ignore: cast_nullable_to_non_nullable
as List<NavEntry>,topNavRightEntries: null == topNavRightEntries ? _self.topNavRightEntries : topNavRightEntries // ignore: cast_nullable_to_non_nullable
as List<NavEntry>,showBottomNavbar: null == showBottomNavbar ? _self.showBottomNavbar : showBottomNavbar // ignore: cast_nullable_to_non_nullable
as bool,bottomNavEntries: null == bottomNavEntries ? _self.bottomNavEntries : bottomNavEntries // ignore: cast_nullable_to_non_nullable
as List<NavEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [NavbarState].
extension NavbarStatePatterns on NavbarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavbarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavbarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavbarState value)  $default,){
final _that = this;
switch (_that) {
case _NavbarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavbarState value)?  $default,){
final _that = this;
switch (_that) {
case _NavbarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showTopNavbar,  List<NavEntry> topNavLeftEntries,  List<NavEntry> topNavRightEntries,  bool showBottomNavbar,  List<NavEntry> bottomNavEntries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavbarState() when $default != null:
return $default(_that.showTopNavbar,_that.topNavLeftEntries,_that.topNavRightEntries,_that.showBottomNavbar,_that.bottomNavEntries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showTopNavbar,  List<NavEntry> topNavLeftEntries,  List<NavEntry> topNavRightEntries,  bool showBottomNavbar,  List<NavEntry> bottomNavEntries)  $default,) {final _that = this;
switch (_that) {
case _NavbarState():
return $default(_that.showTopNavbar,_that.topNavLeftEntries,_that.topNavRightEntries,_that.showBottomNavbar,_that.bottomNavEntries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showTopNavbar,  List<NavEntry> topNavLeftEntries,  List<NavEntry> topNavRightEntries,  bool showBottomNavbar,  List<NavEntry> bottomNavEntries)?  $default,) {final _that = this;
switch (_that) {
case _NavbarState() when $default != null:
return $default(_that.showTopNavbar,_that.topNavLeftEntries,_that.topNavRightEntries,_that.showBottomNavbar,_that.bottomNavEntries);case _:
  return null;

}
}

}

/// @nodoc


class _NavbarState implements NavbarState {
  const _NavbarState({this.showTopNavbar = false, final  List<NavEntry> topNavLeftEntries = const [], final  List<NavEntry> topNavRightEntries = const [], this.showBottomNavbar = false, final  List<NavEntry> bottomNavEntries = const []}): _topNavLeftEntries = topNavLeftEntries,_topNavRightEntries = topNavRightEntries,_bottomNavEntries = bottomNavEntries;
  

@override@JsonKey() final  bool showTopNavbar;
 final  List<NavEntry> _topNavLeftEntries;
@override@JsonKey() List<NavEntry> get topNavLeftEntries {
  if (_topNavLeftEntries is EqualUnmodifiableListView) return _topNavLeftEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topNavLeftEntries);
}

 final  List<NavEntry> _topNavRightEntries;
@override@JsonKey() List<NavEntry> get topNavRightEntries {
  if (_topNavRightEntries is EqualUnmodifiableListView) return _topNavRightEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topNavRightEntries);
}

@override@JsonKey() final  bool showBottomNavbar;
 final  List<NavEntry> _bottomNavEntries;
@override@JsonKey() List<NavEntry> get bottomNavEntries {
  if (_bottomNavEntries is EqualUnmodifiableListView) return _bottomNavEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bottomNavEntries);
}


/// Create a copy of NavbarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavbarStateCopyWith<_NavbarState> get copyWith => __$NavbarStateCopyWithImpl<_NavbarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavbarState&&(identical(other.showTopNavbar, showTopNavbar) || other.showTopNavbar == showTopNavbar)&&const DeepCollectionEquality().equals(other._topNavLeftEntries, _topNavLeftEntries)&&const DeepCollectionEquality().equals(other._topNavRightEntries, _topNavRightEntries)&&(identical(other.showBottomNavbar, showBottomNavbar) || other.showBottomNavbar == showBottomNavbar)&&const DeepCollectionEquality().equals(other._bottomNavEntries, _bottomNavEntries));
}


@override
int get hashCode => Object.hash(runtimeType,showTopNavbar,const DeepCollectionEquality().hash(_topNavLeftEntries),const DeepCollectionEquality().hash(_topNavRightEntries),showBottomNavbar,const DeepCollectionEquality().hash(_bottomNavEntries));

@override
String toString() {
  return 'NavbarState(showTopNavbar: $showTopNavbar, topNavLeftEntries: $topNavLeftEntries, topNavRightEntries: $topNavRightEntries, showBottomNavbar: $showBottomNavbar, bottomNavEntries: $bottomNavEntries)';
}


}

/// @nodoc
abstract mixin class _$NavbarStateCopyWith<$Res> implements $NavbarStateCopyWith<$Res> {
  factory _$NavbarStateCopyWith(_NavbarState value, $Res Function(_NavbarState) _then) = __$NavbarStateCopyWithImpl;
@override @useResult
$Res call({
 bool showTopNavbar, List<NavEntry> topNavLeftEntries, List<NavEntry> topNavRightEntries, bool showBottomNavbar, List<NavEntry> bottomNavEntries
});




}
/// @nodoc
class __$NavbarStateCopyWithImpl<$Res>
    implements _$NavbarStateCopyWith<$Res> {
  __$NavbarStateCopyWithImpl(this._self, this._then);

  final _NavbarState _self;
  final $Res Function(_NavbarState) _then;

/// Create a copy of NavbarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showTopNavbar = null,Object? topNavLeftEntries = null,Object? topNavRightEntries = null,Object? showBottomNavbar = null,Object? bottomNavEntries = null,}) {
  return _then(_NavbarState(
showTopNavbar: null == showTopNavbar ? _self.showTopNavbar : showTopNavbar // ignore: cast_nullable_to_non_nullable
as bool,topNavLeftEntries: null == topNavLeftEntries ? _self._topNavLeftEntries : topNavLeftEntries // ignore: cast_nullable_to_non_nullable
as List<NavEntry>,topNavRightEntries: null == topNavRightEntries ? _self._topNavRightEntries : topNavRightEntries // ignore: cast_nullable_to_non_nullable
as List<NavEntry>,showBottomNavbar: null == showBottomNavbar ? _self.showBottomNavbar : showBottomNavbar // ignore: cast_nullable_to_non_nullable
as bool,bottomNavEntries: null == bottomNavEntries ? _self._bottomNavEntries : bottomNavEntries // ignore: cast_nullable_to_non_nullable
as List<NavEntry>,
  ));
}


}

// dart format on
