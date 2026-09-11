import 'package:influencia/features/home/data/models/topic_model.dart';

/// Contrato das fontes de dados de topicos em alta.
abstract class TopicDataSource {
  Future<List<TopicModel>> fetchTrendingTopics();
}
