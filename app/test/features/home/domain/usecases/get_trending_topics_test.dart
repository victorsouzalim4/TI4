import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/core/errors/failures.dart';
import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';
import 'package:influencia/features/home/domain/repositories/topic_repository.dart';
import 'package:influencia/features/home/domain/usecases/get_trending_topics.dart';
import 'package:mocktail/mocktail.dart';

class _MockTopicRepository extends Mock implements TopicRepository;

void main() {
  late _MockTopicRepository repository;
  late GetTrendingTopics usecase;

  setUp(() {
    repository = _MockTopicRepository();
    usecase = GetTrendingTopics(repository);
  });

  group('GetTrendingTopics', () {
    test('ordena os topicos por mencoes em ordem decrescente', () async {
      const topics = [
        Topic(id: 't1', title: 'Menos citado', mentions: 10, sentiment: 0.5),
        Topic(id: 't2', title: 'Mais citado', mentions: 42, sentiment: 0.5),
        Topic(id: 't3', title: 'Intermediario', mentions: 27, sentiment: 0.5),
      ];
      when(repository.getTrendingTopics)
          .thenAnswer((_) async => const Ok(topics));

      final result = await usecase();

      expect(result, isA<Ok<List<Topic>>>());
      final value = (result as Ok<List<Topic>>).value;
      expect(value.map((topic) => topic.mentions).toList(), [42, 27, 10]);
      verify(repository.getTrendingTopics).called(1);
    });

    test('nao modifica a lista original ao ordenar', () async {
      const topics = [
        Topic(id: 't1', title: 'Primeiro', mentions: 1, sentiment: 0.5),
        Topic(id: 't2', title: 'Segundo', mentions: 2, sentiment: 0.5),
      ];
      when(repository.getTrendingTopics)
          .thenAnswer((_) async => const Ok(topics));

      await usecase();

      expect(topics.first.mentions, 1);
    });

    test('repassa Err com a mesma Failure do repositorio', () async {
      const failure = NetworkFailure(message: 'sem conexão');
      when(repository.getTrendingTopics)
          .thenAnswer((_) async => const Err<List<Topic>>(failure));

      final result = await usecase();

      expect(result, isA<Err<List<Topic>>>());
      expect((result as Err<List<Topic>>).failure, same(failure));
    });
  });
}
