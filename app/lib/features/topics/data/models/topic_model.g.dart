// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicModel _$TopicModelFromJson(Map<String, dynamic> json) => _TopicModel(
  id: json['id'] as String,
  title: json['title'] as String,
  mentions: (json['mentions'] as num).toInt(),
  sentiment: (json['sentiment'] as num).toDouble(),
);

Map<String, dynamic> _$TopicModelToJson(_TopicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mentions': instance.mentions,
      'sentiment': instance.sentiment,
    };
