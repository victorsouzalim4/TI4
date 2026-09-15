import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:influencia/features/topics/data/models/topic_model.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';
import 'package:influencia/features/topics/domain/entities/topic_analysis.dart';

part 'topic_analysis_model.freezed.dart';
part 'topic_analysis_model.g.dart';

/// Representacao serializavel da analise de um topico.
@freezed
abstract class TopicAnalysisModel with _$TopicAnalysisModel {
  const factory({
    required TopicModel topic,
    required double positiveShare,
    required double neutralShare,
    required double negativeShare,
    required List<TopicTermModel> terms,
    required List<AudienceCommentModel> comments,
  }) = _TopicAnalysisModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TopicAnalysisModelFromJson(json);

  TopicAnalysis toEntity() {
    return TopicAnalysis(
      topic: topic.toEntity(),
      positiveShare: positiveShare,
      neutralShare: neutralShare,
      negativeShare: negativeShare,
      terms: terms.map((term) => term.toEntity()).toList(),
      comments: comments.map((comment) => comment.toEntity()).toList(),
    );
  }
}

@freezed
abstract class TopicTermModel with _$TopicTermModel {
  const factory({required String term, required int count}) = _TopicTermModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$TopicTermModelFromJson(json);

  TopicTerm toEntity() => TopicTerm(term: term, count: count);
}

@freezed
abstract class AudienceCommentModel with _$AudienceCommentModel {
  const factory({
    required String author,
    required String text,
    required Sentiment sentiment,
  }) = _AudienceCommentModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$AudienceCommentModelFromJson(json);

  AudienceComment toEntity() {
    return AudienceComment(author: author, text: text, sentiment: sentiment);
  }
}
