import 'package:dio/dio.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/home/data/datasources/topic_data_source.dart';
import 'package:influencia/features/home/data/models/topic_model.dart';

/// Fonte de dados HTTP do backend Vortex.
class RemoteTopicDataSource implements TopicDataSource {
  const new(this._dio);

  static const String _topicsPath = '/topics';

  final Dio _dio;

  @override
  Future<List<TopicModel>> fetchTrendingTopics() async {
    try {
      final response = await _dio.get<List<dynamic>>(_topicsPath);
      final data = response.data ?? <dynamic>[];
      return data
          .map((json) => TopicModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (exception) {
      final appException = exception.error;
      if (appException is AppException) {
        throw appException;
      }
      throw UnexpectedException(
        message: exception.message ?? 'Falha inesperada ao buscar tópicos.',
      );
    }
  }
}
