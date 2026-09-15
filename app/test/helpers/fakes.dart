import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/profile/data/datasources/profile_data_source.dart';
import 'package:influencia/features/profile/data/models/profile_model.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';
import 'package:influencia/features/scripts/data/datasources/script_data_source.dart';
import 'package:influencia/features/scripts/data/models/script_model.dart';
import 'package:influencia/features/topics/data/datasources/topic_data_source.dart';
import 'package:influencia/features/topics/data/models/topic_analysis_model.dart';
import 'package:influencia/features/topics/data/models/topic_model.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';

const fakeTopics = [
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

const fakeAnalysis = TopicAnalysisModel(
  topic: TopicModel(
    id: 't1',
    title: 'Rotina de edição com IA',
    mentions: 342,
    sentiment: 0.86,
  ),
  positiveShare: 0.62,
  neutralShare: 0.21,
  negativeShare: 0.17,
  terms: [
    TopicTermModel(term: 'capcut', count: 84),
    TopicTermModel(term: 'legenda', count: 51),
  ],
  comments: [
    AudienceCommentModel(
      author: '@lu.criativa',
      text: 'Faz um vídeo sobre cortes com IA!',
      sentiment: Sentiment.positive,
    ),
  ],
);

final fakeScripts = [
  ScriptModel(
    id: 's1',
    topicId: 't1',
    topicTitle: 'Rotina de edição com IA',
    hook: 'Você edita do jeito errado.',
    development: 'Primeiro parágrafo.\n\nSegundo parágrafo.',
    callToAction: 'Comenta aqui.',
    createdAt: DateTime(2026, 9, 10),
  ),
  ScriptModel(
    id: 's2',
    topicId: 't2',
    topicTitle: 'Shorts vs vídeos longos',
    hook: 'Shorts ou longos?',
    development: 'Desenvolvimento.',
    callToAction: 'Se inscreve.',
    createdAt: DateTime(2026, 9, 12),
  ),
];

const fakeProfile = ProfileModel(
  name: 'Marina Costa',
  handle: '@marinacria',
  niche: 'Criação de conteúdo',
  scriptTone: 'Descontraído',
  commentsAnalyzed: 12480,
  scriptsGenerated: 2,
  platforms: [
    PlatformConnectionModel(
      platform: SocialPlatform.youtube,
      isConnected: true,
      handle: '@marinacria',
    ),
    PlatformConnectionModel(
      platform: SocialPlatform.tiktok,
      isConnected: false,
    ),
  ],
);

/// Datasource de topicos em memoria; [failFirstCalls] faz as primeiras
/// chamadas lancarem [NetworkException] (util para testar retry).
class FakeTopicDataSource implements TopicDataSource {
  new({this.failFirstCalls = 0});

  final int failFirstCalls;

  int calls = 0;

  void _maybeFail() {
    calls++;
    if (calls <= failFirstCalls) {
      throw const NetworkException(message: 'sem conexão');
    }
  }

  @override
  Future<List<TopicModel>> fetchTrendingTopics() async {
    _maybeFail();
    return fakeTopics;
  }

  @override
  Future<TopicAnalysisModel> fetchTopicAnalysis(String topicId) async {
    _maybeFail();
    return fakeAnalysis;
  }
}

/// Datasource de roteiros em memoria com geracao deterministica.
class FakeScriptDataSource implements ScriptDataSource {
  new({List<ScriptModel>? scripts}) : scripts = scripts ?? [...fakeScripts];

  final List<ScriptModel> scripts;

  int regenerations = 0;

  @override
  Future<List<ScriptModel>> fetchScripts() async => scripts;

  @override
  Future<ScriptModel> fetchScript(String scriptId) async {
    return scripts.firstWhere((script) => script.id == scriptId);
  }

  @override
  Future<ScriptModel> createScript(String topicId) async {
    final script = fakeScripts.first.copyWith(id: 'novo', topicId: topicId);
    scripts.add(script);
    return script;
  }

  @override
  Future<ScriptModel> regenerateScript(String scriptId) async {
    regenerations++;
    final index = scripts.indexWhere((script) => script.id == scriptId);
    final updated = scripts[index].copyWith(hook: 'Gancho regenerado.');
    scripts[index] = updated;
    return updated;
  }
}

class FakeProfileDataSource implements ProfileDataSource {
  @override
  Future<ProfileModel> fetchProfile() async => fakeProfile;
}
