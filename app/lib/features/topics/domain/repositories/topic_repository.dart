import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';
import 'package:influencia/features/topics/domain/entities/topic_analysis.dart';

/// Contrato de acesso aos topicos em alta e suas analises.
abstract class TopicRepository {
  Future<Result<List<Topic>>> getTrendingTopics();

  Future<Result<TopicAnalysis>> getTopicAnalysis(String topicId);
}
