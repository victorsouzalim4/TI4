import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/core/errors/failures.dart';
import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/home/data/datasources/topic_data_source.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';
import 'package:influencia/features/home/domain/repositories/topic_repository.dart';

/// Implementacao de [TopicRepository] baseada em um [TopicDataSource].
class TopicRepositoryImpl implements TopicRepository {
  const new(this._dataSource);

  final TopicDataSource _dataSource;

  @override
  Future<Result<List<Topic>>> getTrendingTopics() async {
    try {
      final models = await _dataSource.fetchTrendingTopics();
      return Ok(models.map((model) => model.toEntity()).toList());
    } on AppException catch (exception) {
      return Err(_mapAppExceptionToFailure(exception));
    } on Exception catch (exception) {
      return Err(UnexpectedFailure(message: exception.toString()));
    }
  }

  Failure _mapAppExceptionToFailure(AppException exception) {
    return switch (exception) {
      NetworkException(:final message) => NetworkFailure(message: message),
      ServerException(:final message) => ServerFailure(message: message),
      UnexpectedException(:final message) => UnexpectedFailure(
        message: message,
      ),
    };
  }
}
