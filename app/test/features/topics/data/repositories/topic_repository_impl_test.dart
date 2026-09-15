import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/core/errors/failures.dart';
import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/topics/data/datasources/topic_data_source.dart';
import 'package:influencia/features/topics/data/models/topic_model.dart';
import 'package:influencia/features/topics/data/repositories/topic_repository_impl.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';
import 'package:mocktail/mocktail.dart';

class _MockTopicDataSource extends Mock implements TopicDataSource;

void main() {
  late _MockTopicDataSource dataSource;
  late TopicRepositoryImpl repository;

  setUp(() {
    dataSource = _MockTopicDataSource();
    repository = TopicRepositoryImpl(dataSource);
  });

  group('TopicRepositoryImpl.getTrendingTopics', () {
    test('retorna Ok com as entidades convertidas', () async {
      const models = [
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
      ];
      when(dataSource.fetchTrendingTopics).thenAnswer((_) async => models);

      final result = await repository.getTrendingTopics();

      expect(result, isA<Ok<List<Topic>>>());
      final value = (result as Ok<List<Topic>>).value;
      expect(value, [
        const Topic(
          id: 't1',
          title: 'Rotina de edição com IA',
          mentions: 342,
          sentiment: 0.86,
        ),
        const Topic(
          id: 't2',
          title: 'Shorts vs vídeos longos',
          mentions: 289,
          sentiment: 0.61,
        ),
      ]);
    });

    test('NetworkException vira Err com NetworkFailure', () async {
      when(dataSource.fetchTrendingTopics)
          .thenThrow(const NetworkException(message: 'sem conexão'));

      final result = await repository.getTrendingTopics();

      expect(result, isA<Err<List<Topic>>>());
      final failure = (result as Err<List<Topic>>).failure;
      expect(
        failure,
        isA<NetworkFailure>().having(
          (networkFailure) => networkFailure.message,
          'message',
          'sem conexão',
        ),
      );
    });

    test('ServerException vira Err com ServerFailure', () async {
      when(
        dataSource.fetchTrendingTopics,
      ).thenThrow(const ServerException(message: 'erro 500', statusCode: 500));

      final result = await repository.getTrendingTopics();

      expect(result, isA<Err<List<Topic>>>());
      final failure = (result as Err<List<Topic>>).failure;
      expect(
        failure,
        isA<ServerFailure>().having(
          (serverFailure) => serverFailure.message,
          'message',
          'erro 500',
        ),
      );
    });

    test('UnexpectedException vira Err com UnexpectedFailure', () async {
      when(dataSource.fetchTrendingTopics)
          .thenThrow(const UnexpectedException(message: 'algo quebrou'));

      final result = await repository.getTrendingTopics();

      expect(result, isA<Err<List<Topic>>>());
      expect((result as Err<List<Topic>>).failure, isA<UnexpectedFailure>());
    });

    test('excecao generica vira Err com UnexpectedFailure', () async {
      when(dataSource.fetchTrendingTopics)
          .thenThrow(Exception('falha desconhecida'));

      final result = await repository.getTrendingTopics();

      expect(result, isA<Err<List<Topic>>>());
      final failure = (result as Err<List<Topic>>).failure;
      expect(
        failure,
        isA<UnexpectedFailure>().having(
          (unexpectedFailure) => unexpectedFailure.message,
          'message',
          contains('falha desconhecida'),
        ),
      );
    });
  });
}
