import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/scripts/data/datasources/mock_script_data_source.dart';

void main() {
  late MockScriptDataSource dataSource;

  setUp(() {
    dataSource = MockScriptDataSource(now: () => DateTime(2026, 9, 15));
  });

  group('MockScriptDataSource', () {
    test('comeca com dois roteiros ordenados do mais recente', () async {
      final scripts = await dataSource.fetchScripts();

      expect(scripts.map((script) => script.id), ['script-002', 'script-001']);
    });

    test('createScript adiciona um roteiro com o titulo do topico', () async {
      final created = await dataSource.createScript('topic-001');

      expect(created.id, 'script-003');
      expect(created.topicTitle, 'Rotina de edição com IA');
      expect(created.hook, contains('Rotina de edição com IA'));
      expect(created.createdAt, DateTime(2026, 9, 15));
      expect((await dataSource.fetchScripts()).length, 3);
    });

    test('regenerateScript troca o gancho mantendo o id', () async {
      final before = await dataSource.fetchScript('script-001');

      final after = await dataSource.regenerateScript('script-001');

      expect(after.id, before.id);
      expect(after.topicId, before.topicId);
      expect(after.hook, isNot(before.hook));
      expect((await dataSource.fetchScript('script-001')).hook, after.hook);
    });

    test('topico desconhecido lanca ServerException 404', () {
      expect(
        () => dataSource.createScript('nao-existe'),
        throwsA(
          isA<ServerException>().having((e) => e.statusCode, 'status', 404),
        ),
      );
    });

    test('roteiro desconhecido lanca ServerException 404', () {
      expect(
        () => dataSource.fetchScript('nao-existe'),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
