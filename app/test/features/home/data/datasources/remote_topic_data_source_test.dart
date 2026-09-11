import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/home/data/datasources/remote_topic_data_source.dart';
import 'package:influencia/features/home/data/models/topic_model.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio;

void main() {
  late _MockDio dio;
  late RemoteTopicDataSource dataSource;

  setUp(() {
    dio = _MockDio();
    dataSource = RemoteTopicDataSource(dio);
  });

  group('RemoteTopicDataSource.fetchTrendingTopics', () {
    test('resposta 200 com lista vira List<TopicModel>', () async {
      when(() => dio.get<List<dynamic>>('/topics')).thenAnswer(
        (_) async => Response<List<dynamic>>(
          requestOptions: RequestOptions(path: '/topics'),
          statusCode: 200,
          data: <dynamic>[
            <String, dynamic>{
              'id': 't1',
              'title': 'Rotina de edição com IA',
              'mentions': 342,
              'sentiment': 0.86,
            },
            <String, dynamic>{
              'id': 't2',
              'title': 'Shorts vs vídeos longos',
              'mentions': 289,
              'sentiment': 0.61,
            },
          ],
        ),
      );

      final models = await dataSource.fetchTrendingTopics();

      expect(models, const [
        TopicModel(
          id: 't1',
          title: 'Rotina de edição com IA',
          mentions: 342,
          sentiment: 0.86,
        ),
        TopicModel(
          id: 't2',
          title: 'Shorts vs vídeos longos',
          mentions: 289,
          sentiment: 0.61,
        ),
      ]);
    });

    test('resposta sem corpo vira lista vazia', () async {
      when(() => dio.get<List<dynamic>>('/topics')).thenAnswer(
        (_) async => Response<List<dynamic>>(
          requestOptions: RequestOptions(path: '/topics'),
          statusCode: 200,
        ),
      );

      final models = await dataSource.fetchTrendingTopics();

      expect(models, isEmpty);
    });

    test('DioException com AppException propaga a AppException', () async {
      when(() => dio.get<List<dynamic>>('/topics')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/topics'),
          type: DioExceptionType.connectionTimeout,
          error: const NetworkException(message: 'timeout'),
        ),
      );

      await expectLater(
        dataSource.fetchTrendingTopics(),
        throwsA(
          isA<NetworkException>().having(
            (networkException) => networkException.message,
            'message',
            'timeout',
          ),
        ),
      );
    });

    test('DioException sem AppException vira UnexpectedException', () async {
      when(() => dio.get<List<dynamic>>('/topics')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/topics'),
          message: 'falha bruta',
        ),
      );

      await expectLater(
        dataSource.fetchTrendingTopics(),
        throwsA(
          isA<UnexpectedException>().having(
            (unexpectedException) => unexpectedException.message,
            'message',
            'falha bruta',
          ),
        ),
      );
    });
  });
}
