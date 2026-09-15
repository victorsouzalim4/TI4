import 'package:influencia/features/topics/data/models/topic_analysis_model.dart';
import 'package:influencia/features/topics/data/models/topic_model.dart';

/// Contrato das fontes de dados de topicos.
abstract class TopicDataSource {
  Future<List<TopicModel>> fetchTrendingTopics();

  Future<TopicAnalysisModel> fetchTopicAnalysis(String topicId);
}
