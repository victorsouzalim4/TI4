// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicAnalysisModel _$TopicAnalysisModelFromJson(Map<String, dynamic> json) =>
    _TopicAnalysisModel(
      topic: TopicModel.fromJson(json['topic'] as Map<String, dynamic>),
      positiveShare: (json['positiveShare'] as num).toDouble(),
      neutralShare: (json['neutralShare'] as num).toDouble(),
      negativeShare: (json['negativeShare'] as num).toDouble(),
      terms: (json['terms'] as List<dynamic>)
          .map((e) => TopicTermModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => AudienceCommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicAnalysisModelToJson(_TopicAnalysisModel instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'positiveShare': instance.positiveShare,
      'neutralShare': instance.neutralShare,
      'negativeShare': instance.negativeShare,
      'terms': instance.terms,
      'comments': instance.comments,
    };

_TopicTermModel _$TopicTermModelFromJson(Map<String, dynamic> json) =>
    _TopicTermModel(
      term: json['term'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$TopicTermModelToJson(_TopicTermModel instance) =>
    <String, dynamic>{'term': instance.term, 'count': instance.count};

_AudienceCommentModel _$AudienceCommentModelFromJson(
  Map<String, dynamic> json,
) => _AudienceCommentModel(
  author: json['author'] as String,
  text: json['text'] as String,
  sentiment: $enumDecode(_$SentimentEnumMap, json['sentiment']),
);

Map<String, dynamic> _$AudienceCommentModelToJson(
  _AudienceCommentModel instance,
) => <String, dynamic>{
  'author': instance.author,
  'text': instance.text,
  'sentiment': _$SentimentEnumMap[instance.sentiment]!,
};

const _$SentimentEnumMap = {
  Sentiment.positive: 'positive',
  Sentiment.neutral: 'neutral',
  Sentiment.negative: 'negative',
};
