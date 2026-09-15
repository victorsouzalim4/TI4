import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/topics/data/datasources/topic_data_source.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';
import 'package:influencia/features/topics/domain/entities/topic_analysis.dart';
import 'package:influencia/features/topics/domain/repositories/topic_repository.dart';

/// Implementacao de [TopicRepository] baseada em um [TopicDataSource].
class TopicRepositoryImpl implements TopicRepository {
  const new(this._dataSource);

  final TopicDataSource _dataSource;

  @override
  Future<Result<List<Topic>>> getTrendingTopics() {
    return guard(() async {
      final models = await _dataSource.fetchTrendingTopics();
      return models.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<Result<TopicAnalysis>> getTopicAnalysis(String topicId) {
    return guard(() async {
      final model = await _dataSource.fetchTopicAnalysis(topicId);
      return model.toEntity();
    });
  }
}
