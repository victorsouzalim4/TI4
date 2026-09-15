// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get name; String get handle; String get niche; String get scriptTone; int get commentsAnalyzed; int get scriptsGenerated; List<PlatformConnectionModel> get platforms;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.handle, _this.handle) || other.handle == _this.handle)&&(identical(other.niche, _this.niche) || other.niche == _this.niche)&&(identical(other.scriptTone, _this.scriptTone) || other.scriptTone == _this.scriptTone)&&(identical(other.commentsAnalyzed, _this.commentsAnalyzed) || other.commentsAnalyzed == _this.commentsAnalyzed)&&(identical(other.scriptsGenerated, _this.scriptsGenerated) || other.scriptsGenerated == _this.scriptsGenerated)&&const DeepCollectionEquality().equals(other.platforms, _this.platforms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileModel;
  return Object.hash(runtimeType,_this.name,_this.handle,_this.niche,_this.scriptTone,_this.commentsAnalyzed,_this.scriptsGenerated,const DeepCollectionEquality().hash(_this.platforms));
}

@override
String toString() {
  final _this = this as ProfileModel;
  return 'ProfileModel(name: ${_this.name}, handle: ${_this.handle}, niche: ${_this.niche}, scriptTone: ${_this.scriptTone}, commentsAnalyzed: ${_this.commentsAnalyzed}, scriptsGenerated: ${_this.scriptsGenerated}, platforms: ${_this.platforms})';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String name, String handle, String niche, String scriptTone, int commentsAnalyzed, int scriptsGenerated, List<PlatformConnectionModel> platforms
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? handle = null,Object? niche = null,Object? scriptTone = null,Object? commentsAnalyzed = null,Object? scriptsGenerated = null,Object? platforms = null,}) {
  return _then(ProfileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,niche: null == niche ? _self.niche : niche // ignore: cast_nullable_to_non_nullable
as String,scriptTone: null == scriptTone ? _self.scriptTone : scriptTone // ignore: cast_nullable_to_non_nullable
as String,commentsAnalyzed: null == commentsAnalyzed ? _self.commentsAnalyzed : commentsAnalyzed // ignore: cast_nullable_to_non_nullable
as int,scriptsGenerated: null == scriptsGenerated ? _self.scriptsGenerated : scriptsGenerated // ignore: cast_nullable_to_non_nullable
as int,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformConnectionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String handle,  String niche,  String scriptTone,  int commentsAnalyzed,  int scriptsGenerated,  List<PlatformConnectionModel> platforms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.name,_that.handle,_that.niche,_that.scriptTone,_that.commentsAnalyzed,_that.scriptsGenerated,_that.platforms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String handle,  String niche,  String scriptTone,  int commentsAnalyzed,  int scriptsGenerated,  List<PlatformConnectionModel> platforms)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.name,_that.handle,_that.niche,_that.scriptTone,_that.commentsAnalyzed,_that.scriptsGenerated,_that.platforms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String handle,  String niche,  String scriptTone,  int commentsAnalyzed,  int scriptsGenerated,  List<PlatformConnectionModel> platforms)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.name,_that.handle,_that.niche,_that.scriptTone,_that.commentsAnalyzed,_that.scriptsGenerated,_that.platforms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({required this.name, required this.handle, required this.niche, required this.scriptTone, required this.commentsAnalyzed, required this.scriptsGenerated, required  List<PlatformConnectionModel> platforms}): _platforms = platforms,super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String name;
@override final  String handle;
@override final  String niche;
@override final  String scriptTone;
@override final  int commentsAnalyzed;
@override final  int scriptsGenerated;
 final  List<PlatformConnectionModel> _platforms;
@override List<PlatformConnectionModel> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}


/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.niche, niche) || other.niche == niche)&&(identical(other.scriptTone, scriptTone) || other.scriptTone == scriptTone)&&(identical(other.commentsAnalyzed, commentsAnalyzed) || other.commentsAnalyzed == commentsAnalyzed)&&(identical(other.scriptsGenerated, scriptsGenerated) || other.scriptsGenerated == scriptsGenerated)&&const DeepCollectionEquality().equals(other.platforms, _platforms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,handle,niche,scriptTone,commentsAnalyzed,scriptsGenerated,const DeepCollectionEquality().hash(_platforms));
}

@override
String toString() {
    return 'ProfileModel(name: $name, handle: $handle, niche: $niche, scriptTone: $scriptTone, commentsAnalyzed: $commentsAnalyzed, scriptsGenerated: $scriptsGenerated, platforms: $platforms)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String handle, String niche, String scriptTone, int commentsAnalyzed, int scriptsGenerated, List<PlatformConnectionModel> platforms
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? handle = null,Object? niche = null,Object? scriptTone = null,Object? commentsAnalyzed = null,Object? scriptsGenerated = null,Object? platforms = null,}) {
  return _then(_ProfileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,niche: null == niche ? _self.niche : niche // ignore: cast_nullable_to_non_nullable
as String,scriptTone: null == scriptTone ? _self.scriptTone : scriptTone // ignore: cast_nullable_to_non_nullable
as String,commentsAnalyzed: null == commentsAnalyzed ? _self.commentsAnalyzed : commentsAnalyzed // ignore: cast_nullable_to_non_nullable
as int,scriptsGenerated: null == scriptsGenerated ? _self.scriptsGenerated : scriptsGenerated // ignore: cast_nullable_to_non_nullable
as int,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformConnectionModel>,
  ));
}


}


/// @nodoc
mixin _$PlatformConnectionModel {

 SocialPlatform get platform; bool get isConnected; String? get handle;
/// Create a copy of PlatformConnectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformConnectionModelCopyWith<PlatformConnectionModel> get copyWith => _$PlatformConnectionModelCopyWithImpl<PlatformConnectionModel>(this as PlatformConnectionModel, _$identity);

  /// Serializes this PlatformConnectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlatformConnectionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformConnectionModel&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.isConnected, _this.isConnected) || other.isConnected == _this.isConnected)&&(identical(other.handle, _this.handle) || other.handle == _this.handle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlatformConnectionModel;
  return Object.hash(runtimeType,_this.platform,_this.isConnected,_this.handle);
}

@override
String toString() {
  final _this = this as PlatformConnectionModel;
  return 'PlatformConnectionModel(platform: ${_this.platform}, isConnected: ${_this.isConnected}, handle: ${_this.handle})';
}


}

/// @nodoc
abstract mixin class $PlatformConnectionModelCopyWith<$Res>  {
  factory $PlatformConnectionModelCopyWith(PlatformConnectionModel value, $Res Function(PlatformConnectionModel) _then) = _$PlatformConnectionModelCopyWithImpl;
@useResult
$Res call({
 SocialPlatform platform, bool isConnected, String? handle
});




}
/// @nodoc
class _$PlatformConnectionModelCopyWithImpl<$Res>
    implements $PlatformConnectionModelCopyWith<$Res> {
  _$PlatformConnectionModelCopyWithImpl(this._self, this._then);

  final PlatformConnectionModel _self;
  final $Res Function(PlatformConnectionModel) _then;

/// Create a copy of PlatformConnectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? isConnected = null,Object? handle = freezed,}) {
  return _then(PlatformConnectionModel(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as SocialPlatform,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,handle: freezed == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlatformConnectionModel].
extension PlatformConnectionModelPatterns on PlatformConnectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformConnectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformConnectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformConnectionModel value)  $default,){
final _that = this;
switch (_that) {
case _PlatformConnectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformConnectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformConnectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SocialPlatform platform,  bool isConnected,  String? handle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformConnectionModel() when $default != null:
return $default(_that.platform,_that.isConnected,_that.handle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SocialPlatform platform,  bool isConnected,  String? handle)  $default,) {final _that = this;
switch (_that) {
case _PlatformConnectionModel():
return $default(_that.platform,_that.isConnected,_that.handle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SocialPlatform platform,  bool isConnected,  String? handle)?  $default,) {final _that = this;
switch (_that) {
case _PlatformConnectionModel() when $default != null:
return $default(_that.platform,_that.isConnected,_that.handle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformConnectionModel extends PlatformConnectionModel {
  const _PlatformConnectionModel({required this.platform, required this.isConnected, this.handle}): super._();
  factory _PlatformConnectionModel.fromJson(Map<String, dynamic> json) => _$PlatformConnectionModelFromJson(json);

@override final  SocialPlatform platform;
@override final  bool isConnected;
@override final  String? handle;

/// Create a copy of PlatformConnectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformConnectionModelCopyWith<_PlatformConnectionModel> get copyWith => __$PlatformConnectionModelCopyWithImpl<_PlatformConnectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformConnectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformConnectionModel&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.handle, handle) || other.handle == handle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,platform,isConnected,handle);
}

@override
String toString() {
    return 'PlatformConnectionModel(platform: $platform, isConnected: $isConnected, handle: $handle)';
}


}

/// @nodoc
abstract mixin class _$PlatformConnectionModelCopyWith<$Res> implements $PlatformConnectionModelCopyWith<$Res> {
  factory _$PlatformConnectionModelCopyWith(_PlatformConnectionModel value, $Res Function(_PlatformConnectionModel) _then) = __$PlatformConnectionModelCopyWithImpl;
@override @useResult
$Res call({
 SocialPlatform platform, bool isConnected, String? handle
});




}
/// @nodoc
class __$PlatformConnectionModelCopyWithImpl<$Res>
    implements _$PlatformConnectionModelCopyWith<$Res> {
  __$PlatformConnectionModelCopyWithImpl(this._self, this._then);

  final _PlatformConnectionModel _self;
  final $Res Function(_PlatformConnectionModel) _then;

/// Create a copy of PlatformConnectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? isConnected = null,Object? handle = freezed,}) {
  return _then(_PlatformConnectionModel(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as SocialPlatform,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,handle: freezed == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
