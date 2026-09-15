// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'script_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScriptModel _$ScriptModelFromJson(Map<String, dynamic> json) => _ScriptModel(
  id: json['id'] as String,
  topicId: json['topicId'] as String,
  topicTitle: json['topicTitle'] as String,
  hook: json['hook'] as String,
  development: json['development'] as String,
  callToAction: json['callToAction'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ScriptModelToJson(_ScriptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicId': instance.topicId,
      'topicTitle': instance.topicTitle,
      'hook': instance.hook,
      'development': instance.development,
      'callToAction': instance.callToAction,
      'createdAt': instance.createdAt.toIso8601String(),
    };
