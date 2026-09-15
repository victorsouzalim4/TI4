// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicAnalysisModel {

 TopicModel get topic; double get positiveShare; double get neutralShare; double get negativeShare; List<TopicTermModel> get terms; List<AudienceCommentModel> get comments;
/// Create a copy of TopicAnalysisModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicAnalysisModelCopyWith<TopicAnalysisModel> get copyWith => _$TopicAnalysisModelCopyWithImpl<TopicAnalysisModel>(this as TopicAnalysisModel, _$identity);

  /// Serializes this TopicAnalysisModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopicAnalysisModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicAnalysisModel&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.positiveShare, _this.positiveShare) || other.positiveShare == _this.positiveShare)&&(identical(other.neutralShare, _this.neutralShare) || other.neutralShare == _this.neutralShare)&&(identical(other.negativeShare, _this.negativeShare) || other.negativeShare == _this.negativeShare)&&const DeepCollectionEquality().equals(other.terms, _this.terms)&&const DeepCollectionEquality().equals(other.comments, _this.comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopicAnalysisModel;
  return Object.hash(runtimeType,_this.topic,_this.positiveShare,_this.neutralShare,_this.negativeShare,const DeepCollectionEquality().hash(_this.terms),const DeepCollectionEquality().hash(_this.comments));
}

@override
String toString() {
  final _this = this as TopicAnalysisModel;
  return 'TopicAnalysisModel(topic: ${_this.topic}, positiveShare: ${_this.positiveShare}, neutralShare: ${_this.neutralShare}, negativeShare: ${_this.negativeShare}, terms: ${_this.terms}, comments: ${_this.comments})';
}


}

/// @nodoc
abstract mixin class $TopicAnalysisModelCopyWith<$Res>  {
  factory $TopicAnalysisModelCopyWith(TopicAnalysisModel value, $Res Function(TopicAnalysisModel) _then) = _$TopicAnalysisModelCopyWithImpl;
@useResult
$Res call({
 TopicModel topic, double positiveShare, double neutralShare, double negativeShare, List<TopicTermModel> terms, List<AudienceCommentModel> comments
});


$TopicModelCopyWith<$Res> get topic;

}
/// @nodoc
class _$TopicAnalysisModelCopyWithImpl<$Res>
    implements $TopicAnalysisModelCopyWith<$Res> {
  _$TopicAnalysisModelCopyWithImpl(this._self, this._then);

  final TopicAnalysisModel _self;
  final $Res Function(TopicAnalysisModel) _then;

/// Create a copy of TopicAnalysisModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? positiveShare = null,Object? neutralShare = null,Object? negativeShare = null,Object? terms = null,Object? comments = null,}) {
  return _then(TopicAnalysisModel(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as TopicModel,positiveShare: null == positiveShare ? _self.positiveShare : positiveShare // ignore: cast_nullable_to_non_nullable
as double,neutralShare: null == neutralShare ? _self.neutralShare : neutralShare // ignore: cast_nullable_to_non_nullable
as double,negativeShare: null == negativeShare ? _self.negativeShare : negativeShare // ignore: cast_nullable_to_non_nullable
as double,terms: null == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as List<TopicTermModel>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<AudienceCommentModel>,
  ));
}
/// Create a copy of TopicAnalysisModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicModelCopyWith<$Res> get topic {
  
  return $TopicModelCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopicAnalysisModel].
extension TopicAnalysisModelPatterns on TopicAnalysisModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicAnalysisModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicAnalysisModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicAnalysisModel value)  $default,){
final _that = this;
switch (_that) {
case _TopicAnalysisModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicAnalysisModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopicAnalysisModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TopicModel topic,  double positiveShare,  double neutralShare,  double negativeShare,  List<TopicTermModel> terms,  List<AudienceCommentModel> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicAnalysisModel() when $default != null:
return $default(_that.topic,_that.positiveShare,_that.neutralShare,_that.negativeShare,_that.terms,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TopicModel topic,  double positiveShare,  double neutralShare,  double negativeShare,  List<TopicTermModel> terms,  List<AudienceCommentModel> comments)  $default,) {final _that = this;
switch (_that) {
case _TopicAnalysisModel():
return $default(_that.topic,_that.positiveShare,_that.neutralShare,_that.negativeShare,_that.terms,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TopicModel topic,  double positiveShare,  double neutralShare,  double negativeShare,  List<TopicTermModel> terms,  List<AudienceCommentModel> comments)?  $default,) {final _that = this;
switch (_that) {
case _TopicAnalysisModel() when $default != null:
return $default(_that.topic,_that.positiveShare,_that.neutralShare,_that.negativeShare,_that.terms,_that.comments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicAnalysisModel extends TopicAnalysisModel {
  const _TopicAnalysisModel({required this.topic, required this.positiveShare, required this.neutralShare, required this.negativeShare, required  List<TopicTermModel> terms, required  List<AudienceCommentModel> comments}): _terms = terms,_comments = comments,super._();
  factory _TopicAnalysisModel.fromJson(Map<String, dynamic> json) => _$TopicAnalysisModelFromJson(json);

@override final  TopicModel topic;
@override final  double positiveShare;
@override final  double neutralShare;
@override final  double negativeShare;
 final  List<TopicTermModel> _terms;
@override List<TopicTermModel> get terms {
  if (_terms is EqualUnmodifiableListView) return _terms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_terms);
}

 final  List<AudienceCommentModel> _comments;
@override List<AudienceCommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of TopicAnalysisModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicAnalysisModelCopyWith<_TopicAnalysisModel> get copyWith => __$TopicAnalysisModelCopyWithImpl<_TopicAnalysisModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicAnalysisModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicAnalysisModel&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.positiveShare, positiveShare) || other.positiveShare == positiveShare)&&(identical(other.neutralShare, neutralShare) || other.neutralShare == neutralShare)&&(identical(other.negativeShare, negativeShare) || other.negativeShare == negativeShare)&&const DeepCollectionEquality().equals(other.terms, _terms)&&const DeepCollectionEquality().equals(other.comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,topic,positiveShare,neutralShare,negativeShare,const DeepCollectionEquality().hash(_terms),const DeepCollectionEquality().hash(_comments));
}

@override
String toString() {
    return 'TopicAnalysisModel(topic: $topic, positiveShare: $positiveShare, neutralShare: $neutralShare, negativeShare: $negativeShare, terms: $terms, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$TopicAnalysisModelCopyWith<$Res> implements $TopicAnalysisModelCopyWith<$Res> {
  factory _$TopicAnalysisModelCopyWith(_TopicAnalysisModel value, $Res Function(_TopicAnalysisModel) _then) = __$TopicAnalysisModelCopyWithImpl;
@override @useResult
$Res call({
 TopicModel topic, double positiveShare, double neutralShare, double negativeShare, List<TopicTermModel> terms, List<AudienceCommentModel> comments
});


@override $TopicModelCopyWith<$Res> get topic;

}
/// @nodoc
class __$TopicAnalysisModelCopyWithImpl<$Res>
    implements _$TopicAnalysisModelCopyWith<$Res> {
  __$TopicAnalysisModelCopyWithImpl(this._self, this._then);

  final _TopicAnalysisModel _self;
  final $Res Function(_TopicAnalysisModel) _then;

/// Create a copy of TopicAnalysisModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? positiveShare = null,Object? neutralShare = null,Object? negativeShare = null,Object? terms = null,Object? comments = null,}) {
  return _then(_TopicAnalysisModel(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as TopicModel,positiveShare: null == positiveShare ? _self.positiveShare : positiveShare // ignore: cast_nullable_to_non_nullable
as double,neutralShare: null == neutralShare ? _self.neutralShare : neutralShare // ignore: cast_nullable_to_non_nullable
as double,negativeShare: null == negativeShare ? _self.negativeShare : negativeShare // ignore: cast_nullable_to_non_nullable
as double,terms: null == terms ? _self._terms : terms // ignore: cast_nullable_to_non_nullable
as List<TopicTermModel>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<AudienceCommentModel>,
  ));
}

/// Create a copy of TopicAnalysisModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicModelCopyWith<$Res> get topic {
  
  return $TopicModelCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// @nodoc
mixin _$TopicTermModel {

 String get term; int get count;
/// Create a copy of TopicTermModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicTermModelCopyWith<TopicTermModel> get copyWith => _$TopicTermModelCopyWithImpl<TopicTermModel>(this as TopicTermModel, _$identity);

  /// Serializes this TopicTermModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopicTermModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicTermModel&&(identical(other.term, _this.term) || other.term == _this.term)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopicTermModel;
  return Object.hash(runtimeType,_this.term,_this.count);
}

@override
String toString() {
  final _this = this as TopicTermModel;
  return 'TopicTermModel(term: ${_this.term}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $TopicTermModelCopyWith<$Res>  {
  factory $TopicTermModelCopyWith(TopicTermModel value, $Res Function(TopicTermModel) _then) = _$TopicTermModelCopyWithImpl;
@useResult
$Res call({
 String term, int count
});




}
/// @nodoc
class _$TopicTermModelCopyWithImpl<$Res>
    implements $TopicTermModelCopyWith<$Res> {
  _$TopicTermModelCopyWithImpl(this._self, this._then);

  final TopicTermModel _self;
  final $Res Function(TopicTermModel) _then;

/// Create a copy of TopicTermModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? term = null,Object? count = null,}) {
  return _then(TopicTermModel(
term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicTermModel].
extension TopicTermModelPatterns on TopicTermModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicTermModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicTermModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicTermModel value)  $default,){
final _that = this;
switch (_that) {
case _TopicTermModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicTermModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopicTermModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String term,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicTermModel() when $default != null:
return $default(_that.term,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String term,  int count)  $default,) {final _that = this;
switch (_that) {
case _TopicTermModel():
return $default(_that.term,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String term,  int count)?  $default,) {final _that = this;
switch (_that) {
case _TopicTermModel() when $default != null:
return $default(_that.term,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicTermModel extends TopicTermModel {
  const _TopicTermModel({required this.term, required this.count}): super._();
  factory _TopicTermModel.fromJson(Map<String, dynamic> json) => _$TopicTermModelFromJson(json);

@override final  String term;
@override final  int count;

/// Create a copy of TopicTermModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicTermModelCopyWith<_TopicTermModel> get copyWith => __$TopicTermModelCopyWithImpl<_TopicTermModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicTermModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicTermModel&&(identical(other.term, term) || other.term == term)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,term,count);
}

@override
String toString() {
    return 'TopicTermModel(term: $term, count: $count)';
}


}

/// @nodoc
abstract mixin class _$TopicTermModelCopyWith<$Res> implements $TopicTermModelCopyWith<$Res> {
  factory _$TopicTermModelCopyWith(_TopicTermModel value, $Res Function(_TopicTermModel) _then) = __$TopicTermModelCopyWithImpl;
@override @useResult
$Res call({
 String term, int count
});




}
/// @nodoc
class __$TopicTermModelCopyWithImpl<$Res>
    implements _$TopicTermModelCopyWith<$Res> {
  __$TopicTermModelCopyWithImpl(this._self, this._then);

  final _TopicTermModel _self;
  final $Res Function(_TopicTermModel) _then;

/// Create a copy of TopicTermModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? term = null,Object? count = null,}) {
  return _then(_TopicTermModel(
term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AudienceCommentModel {

 String get author; String get text; Sentiment get sentiment;
/// Create a copy of AudienceCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudienceCommentModelCopyWith<AudienceCommentModel> get copyWith => _$AudienceCommentModelCopyWithImpl<AudienceCommentModel>(this as AudienceCommentModel, _$identity);

  /// Serializes this AudienceCommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AudienceCommentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudienceCommentModel&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.sentiment, _this.sentiment) || other.sentiment == _this.sentiment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AudienceCommentModel;
  return Object.hash(runtimeType,_this.author,_this.text,_this.sentiment);
}

@override
String toString() {
  final _this = this as AudienceCommentModel;
  return 'AudienceCommentModel(author: ${_this.author}, text: ${_this.text}, sentiment: ${_this.sentiment})';
}


}

/// @nodoc
abstract mixin class $AudienceCommentModelCopyWith<$Res>  {
  factory $AudienceCommentModelCopyWith(AudienceCommentModel value, $Res Function(AudienceCommentModel) _then) = _$AudienceCommentModelCopyWithImpl;
@useResult
$Res call({
 String author, String text, Sentiment sentiment
});




}
/// @nodoc
class _$AudienceCommentModelCopyWithImpl<$Res>
    implements $AudienceCommentModelCopyWith<$Res> {
  _$AudienceCommentModelCopyWithImpl(this._self, this._then);

  final AudienceCommentModel _self;
  final $Res Function(AudienceCommentModel) _then;

/// Create a copy of AudienceCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = null,Object? text = null,Object? sentiment = null,}) {
  return _then(AudienceCommentModel(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentiment: null == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as Sentiment,
  ));
}

}


/// Adds pattern-matching-related methods to [AudienceCommentModel].
extension AudienceCommentModelPatterns on AudienceCommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudienceCommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudienceCommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudienceCommentModel value)  $default,){
final _that = this;
switch (_that) {
case _AudienceCommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudienceCommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _AudienceCommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String author,  String text,  Sentiment sentiment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudienceCommentModel() when $default != null:
return $default(_that.author,_that.text,_that.sentiment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String author,  String text,  Sentiment sentiment)  $default,) {final _that = this;
switch (_that) {
case _AudienceCommentModel():
return $default(_that.author,_that.text,_that.sentiment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String author,  String text,  Sentiment sentiment)?  $default,) {final _that = this;
switch (_that) {
case _AudienceCommentModel() when $default != null:
return $default(_that.author,_that.text,_that.sentiment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudienceCommentModel extends AudienceCommentModel {
  const _AudienceCommentModel({required this.author, required this.text, required this.sentiment}): super._();
  factory _AudienceCommentModel.fromJson(Map<String, dynamic> json) => _$AudienceCommentModelFromJson(json);

@override final  String author;
@override final  String text;
@override final  Sentiment sentiment;

/// Create a copy of AudienceCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudienceCommentModelCopyWith<_AudienceCommentModel> get copyWith => __$AudienceCommentModelCopyWithImpl<_AudienceCommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudienceCommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudienceCommentModel&&(identical(other.author, author) || other.author == author)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentiment, sentiment) || other.sentiment == sentiment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,author,text,sentiment);
}

@override
String toString() {
    return 'AudienceCommentModel(author: $author, text: $text, sentiment: $sentiment)';
}


}

/// @nodoc
abstract mixin class _$AudienceCommentModelCopyWith<$Res> implements $AudienceCommentModelCopyWith<$Res> {
  factory _$AudienceCommentModelCopyWith(_AudienceCommentModel value, $Res Function(_AudienceCommentModel) _then) = __$AudienceCommentModelCopyWithImpl;
@override @useResult
$Res call({
 String author, String text, Sentiment sentiment
});




}
/// @nodoc
class __$AudienceCommentModelCopyWithImpl<$Res>
    implements _$AudienceCommentModelCopyWith<$Res> {
  __$AudienceCommentModelCopyWithImpl(this._self, this._then);

  final _AudienceCommentModel _self;
  final $Res Function(_AudienceCommentModel) _then;

/// Create a copy of AudienceCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? text = null,Object? sentiment = null,}) {
  return _then(_AudienceCommentModel(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentiment: null == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as Sentiment,
  ));
}


}

// dart format on
