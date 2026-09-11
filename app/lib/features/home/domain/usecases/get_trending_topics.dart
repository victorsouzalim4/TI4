import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';
import 'package:influencia/features/home/domain/repositories/topic_repository.dart';

/// Retorna os topicos em alta ordenados por mencoes (decrescente).
class GetTrendingTopics {
  const new(this._repository);

  final TopicRepository _repository;

  Future<Result<List<Topic>>> call() async {
    final result = await _repository.getTrendingTopics();
    return result.map(
      (topics) => [...topics]..sort((a, b) => b.mentions.compareTo(a.mentions)),
    );
  }
}
