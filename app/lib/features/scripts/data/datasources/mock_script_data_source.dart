import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/scripts/data/datasources/script_data_source.dart';
import 'package:influencia/features/scripts/data/models/script_model.dart';
import 'package:influencia/features/topics/data/datasources/mock_topic_data_source.dart';

/// Fonte de dados em memoria: mantem os roteiros gerados durante a sessao.
class MockScriptDataSource implements ScriptDataSource {
  new({DateTime Function()? now}) : _now = now ?? DateTime.now {
    _scripts.addAll([
      _build('script-001', 'topic-002', 0, _now().subtract(_twoDays)),
      _build('script-002', 'topic-005', 1, _now().subtract(_oneDay)),
    ]);
  }

  static const Duration _oneDay = Duration(days: 1);
  static const Duration _twoDays = Duration(days: 2);

  /// Variacoes de gancho; a regeneracao avanca para a proxima.
  static const List<String> _hooks = [
    'Você está fazendo {topic} do jeito errado — e os comentários provam.',
    'Ninguém te contou isso sobre {topic}. Fica até o fim.',
    '{topic}: eu li 300 comentários de vocês e a resposta me surpreendeu.',
  ];

  final DateTime Function() _now;

  final List<ScriptModel> _scripts = [];

  /// Quantas versoes cada roteiro ja teve, para variar o gancho.
  final Map<String, int> _versions = {};

  int _nextId = 3;

  @override
  Future<List<ScriptModel>> fetchScripts() async {
    await Future<void>.delayed(AppConstants.mockDataSourceDelay);
    return [..._scripts]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<ScriptModel> fetchScript(String scriptId) async {
    await Future<void>.delayed(AppConstants.mockDataSourceDelay);
    return _find(scriptId);
  }

  @override
  Future<ScriptModel> createScript(String topicId) async {
    await Future<void>.delayed(AppConstants.mockGenerationDelay);
    final sequence = (_nextId++).toString().padLeft(3, '0');
    final script = _build('script-$sequence', topicId, 0, _now());
    _scripts.add(script);
    return script;
  }

  @override
  Future<ScriptModel> regenerateScript(String scriptId) async {
    await Future<void>.delayed(AppConstants.mockGenerationDelay);
    final current = _find(scriptId);
    final version = (_versions[scriptId] ?? 0) + 1;
    _versions[scriptId] = version;
    final updated = _build(scriptId, current.topicId, version, _now());
    _scripts[_scripts.indexOf(current)] = updated;
    return updated;
  }

  ScriptModel _find(String scriptId) {
    final script = _scripts.where((s) => s.id == scriptId).firstOrNull;
    if (script == null) {
      throw const ServerException(
        message: 'Roteiro não encontrado.',
        statusCode: 404,
      );
    }
    return script;
  }

  static ScriptModel _build(
    String id,
    String topicId,
    int version,
    DateTime createdAt,
  ) {
    // O backend conhece o titulo pelo id; o mock reaproveita a lista de
    // topicos mockada para nao duplicar os dados.
    final topic = MockTopicDataSource.topics
        .where((topic) => topic.id == topicId)
        .firstOrNull;
    if (topic == null) {
      throw const ServerException(
        message: 'Tópico não encontrado.',
        statusCode: 404,
      );
    }
    final title = topic.title;
    return ScriptModel(
      id: id,
      topicId: topicId,
      topicTitle: title,
      hook: _hooks[version % _hooks.length].replaceAll('{topic}', title),
      development:
          'Nos últimos dias, "$title" apareceu ${topic.mentions} vezes nos '
          'seus comentários. Comece mostrando o que a audiência mais '
          'perguntou e responda de forma direta, com um exemplo seu.\n\n'
          'Depois, traga o outro lado: o que a maioria erra quando fala de '
          '$title e como você faria diferente. Use um caso real do seu canal '
          'para dar credibilidade.\n\n'
          'Feche com a sua opinião sincera. A audiência valoriza posição '
          'clara mais do que uma lista neutra de prós e contras.',
      callToAction:
          'Comenta aqui qual é a sua experiência com $title. Os melhores '
          'comentários entram no próximo vídeo.',
      createdAt: createdAt,
    );
  }
}
