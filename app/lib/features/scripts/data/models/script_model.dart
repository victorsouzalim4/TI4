import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:influencia/features/scripts/domain/entities/script.dart';

part 'script_model.freezed.dart';
part 'script_model.g.dart';

/// Representacao serializavel de um roteiro retornado pelo backend.
@freezed
abstract class ScriptModel with _$ScriptModel {
  const factory({
    required String id,
    required String topicId,
    required String topicTitle,
    required String hook,
    required String development,
    required String callToAction,
    required DateTime createdAt,
  }) = _ScriptModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$ScriptModelFromJson(json);

  Script toEntity() {
    return Script(
      id: id,
      topicId: topicId,
      topicTitle: topicTitle,
      hook: hook,
      development: development,
      callToAction: callToAction,
      createdAt: createdAt,
    );
  }
}
