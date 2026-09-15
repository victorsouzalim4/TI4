import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';

part 'topic_model.freezed.dart';
part 'topic_model.g.dart';

/// Representacao serializavel de um topico retornado pelo backend.
@freezed
abstract class TopicModel with _$TopicModel {
  const factory({
    required String id,
    required String title,
    required int mentions,
    required double sentiment,
  }) = _TopicModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$TopicModelFromJson(json);

  Topic toEntity() {
    return Topic(
      id: id,
      title: title,
      mentions: mentions,
      sentiment: sentiment,
    );
  }
}
