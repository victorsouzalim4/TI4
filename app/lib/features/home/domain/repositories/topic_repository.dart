import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';

/// Contrato de acesso aos topicos em alta.
abstract class TopicRepository {
  Future<Result<List<Topic>>> getTrendingTopics();
}
