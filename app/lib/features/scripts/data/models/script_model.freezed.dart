// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'script_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScriptModel {

 String get id; String get topicId; String get topicTitle; String get hook; String get development; String get callToAction; DateTime get createdAt;
/// Create a copy of ScriptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScriptModelCopyWith<ScriptModel> get copyWith => _$ScriptModelCopyWithImpl<ScriptModel>(this as ScriptModel, _$identity);

  /// Serializes this ScriptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScriptModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScriptModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.topicId, _this.topicId) || other.topicId == _this.topicId)&&(identical(other.topicTitle, _this.topicTitle) || other.topicTitle == _this.topicTitle)&&(identical(other.hook, _this.hook) || other.hook == _this.hook)&&(identical(other.development, _this.development) || other.development == _this.development)&&(identical(other.callToAction, _this.callToAction) || other.callToAction == _this.callToAction)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScriptModel;
  return Object.hash(runtimeType,_this.id,_this.topicId,_this.topicTitle,_this.hook,_this.development,_this.callToAction,_this.createdAt);
}

@override
String toString() {
  final _this = this as ScriptModel;
  return 'ScriptModel(id: ${_this.id}, topicId: ${_this.topicId}, topicTitle: ${_this.topicTitle}, hook: ${_this.hook}, development: ${_this.development}, callToAction: ${_this.callToAction}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ScriptModelCopyWith<$Res>  {
  factory $ScriptModelCopyWith(ScriptModel value, $Res Function(ScriptModel) _then) = _$ScriptModelCopyWithImpl;
@useResult
$Res call({
 String id, String topicId, String topicTitle, String hook, String development, String callToAction, DateTime createdAt
});




}
/// @nodoc
class _$ScriptModelCopyWithImpl<$Res>
    implements $ScriptModelCopyWith<$Res> {
  _$ScriptModelCopyWithImpl(this._self, this._then);

  final ScriptModel _self;
  final $Res Function(ScriptModel) _then;

/// Create a copy of ScriptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topicId = null,Object? topicTitle = null,Object? hook = null,Object? development = null,Object? callToAction = null,Object? createdAt = null,}) {
  return _then(ScriptModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,topicTitle: null == topicTitle ? _self.topicTitle : topicTitle // ignore: cast_nullable_to_non_nullable
as String,hook: null == hook ? _self.hook : hook // ignore: cast_nullable_to_non_nullable
as String,development: null == development ? _self.development : development // ignore: cast_nullable_to_non_nullable
as String,callToAction: null == callToAction ? _self.callToAction : callToAction // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScriptModel].
extension ScriptModelPatterns on ScriptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScriptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScriptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScriptModel value)  $default,){
final _that = this;
switch (_that) {
case _ScriptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScriptModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScriptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String topicId,  String topicTitle,  String hook,  String development,  String callToAction,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScriptModel() when $default != null:
return $default(_that.id,_that.topicId,_that.topicTitle,_that.hook,_that.development,_that.callToAction,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String topicId,  String topicTitle,  String hook,  String development,  String callToAction,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ScriptModel():
return $default(_that.id,_that.topicId,_that.topicTitle,_that.hook,_that.development,_that.callToAction,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String topicId,  String topicTitle,  String hook,  String development,  String callToAction,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ScriptModel() when $default != null:
return $default(_that.id,_that.topicId,_that.topicTitle,_that.hook,_that.development,_that.callToAction,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScriptModel extends ScriptModel {
  const _ScriptModel({required this.id, required this.topicId, required this.topicTitle, required this.hook, required this.development, required this.callToAction, required this.createdAt}): super._();
  factory _ScriptModel.fromJson(Map<String, dynamic> json) => _$ScriptModelFromJson(json);

@override final  String id;
@override final  String topicId;
@override final  String topicTitle;
@override final  String hook;
@override final  String development;
@override final  String callToAction;
@override final  DateTime createdAt;

/// Create a copy of ScriptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScriptModelCopyWith<_ScriptModel> get copyWith => __$ScriptModelCopyWithImpl<_ScriptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScriptModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScriptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.topicTitle, topicTitle) || other.topicTitle == topicTitle)&&(identical(other.hook, hook) || other.hook == hook)&&(identical(other.development, development) || other.development == development)&&(identical(other.callToAction, callToAction) || other.callToAction == callToAction)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,topicId,topicTitle,hook,development,callToAction,createdAt);
}

@override
String toString() {
    return 'ScriptModel(id: $id, topicId: $topicId, topicTitle: $topicTitle, hook: $hook, development: $development, callToAction: $callToAction, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ScriptModelCopyWith<$Res> implements $ScriptModelCopyWith<$Res> {
  factory _$ScriptModelCopyWith(_ScriptModel value, $Res Function(_ScriptModel) _then) = __$ScriptModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String topicId, String topicTitle, String hook, String development, String callToAction, DateTime createdAt
});




}
/// @nodoc
class __$ScriptModelCopyWithImpl<$Res>
    implements _$ScriptModelCopyWith<$Res> {
  __$ScriptModelCopyWithImpl(this._self, this._then);

  final _ScriptModel _self;
  final $Res Function(_ScriptModel) _then;

/// Create a copy of ScriptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topicId = null,Object? topicTitle = null,Object? hook = null,Object? development = null,Object? callToAction = null,Object? createdAt = null,}) {
  return _then(_ScriptModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,topicTitle: null == topicTitle ? _self.topicTitle : topicTitle // ignore: cast_nullable_to_non_nullable
as String,hook: null == hook ? _self.hook : hook // ignore: cast_nullable_to_non_nullable
as String,development: null == development ? _self.development : development // ignore: cast_nullable_to_non_nullable
as String,callToAction: null == callToAction ? _self.callToAction : callToAction // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
