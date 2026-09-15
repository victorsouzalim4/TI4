import 'package:dio/dio.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/topics/data/datasources/topic_data_source.dart';
import 'package:influencia/features/topics/data/models/topic_analysis_model.dart';
import 'package:influencia/features/topics/data/models/topic_model.dart';

/// Fonte de dados HTTP do backend Vortex.
class RemoteTopicDataSource implements TopicDataSource {
  const new(this._dio);

  static const String _topicsPath = '/topics';

  final Dio _dio;

  @override
  Future<List<TopicModel>> fetchTrendingTopics() {
    return _request(() async {
      final response = await _dio.get<List<dynamic>>(_topicsPath);
      final data = response.data ?? <dynamic>[];
      return data
          .map((json) => TopicModel.fromJson(json as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<TopicAnalysisModel> fetchTopicAnalysis(String topicId) {
    return _request(() async {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_topicsPath/$topicId/analysis',
      );
      return TopicAnalysisModel.fromJson(response.data!);
    });
  }

  /// Executa [call] convertendo [DioException] na [AppException] anexada
  /// pelo `ErrorInterceptor`.
  Future<T> _request<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (exception) {
      final appException = exception.error;
      if (appException is AppException) {
        throw appException;
      }
      throw UnexpectedException(
        message: exception.message ?? 'Falha inesperada na requisição.',
      );
    }
  }
}
