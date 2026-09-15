import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/topics/data/datasources/topic_data_source.dart';
import 'package:influencia/features/topics/data/models/topic_analysis_model.dart';
import 'package:influencia/features/topics/data/models/topic_model.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';

/// Fonte de dados em memoria usada enquanto o backend Vortex nao existe.
class MockTopicDataSource implements TopicDataSource {
  static const List<TopicModel> topics = [
    TopicModel(
      id: 'topic-001',
      title: 'Rotina de edição com IA',
      mentions: 342,
      sentiment: 0.86,
    ),
    TopicModel(
      id: 'topic-002',
      title: 'Shorts vs vídeos longos',
      mentions: 289,
      sentiment: 0.61,
    ),
    TopicModel(
      id: 'topic-003',
      title: 'Bastidores da produção de conteúdo',
      mentions: 254,
      sentiment: 0.78,
    ),
    TopicModel(
      id: 'topic-004',
      title: 'Monetização além do AdSense',
      mentions: 231,
      sentiment: 0.72,
    ),
    TopicModel(
      id: 'topic-005',
      title: 'Como lidar com haters nos comentários',
      mentions: 187,
      sentiment: 0.34,
    ),
    TopicModel(
      id: 'topic-006',
      title: 'Setup barato para gravar em casa',
      mentions: 158,
      sentiment: 0.69,
    ),
  ];

  static const Map<String, _AnalysisSeed> _analyses = {
    'topic-001': _AnalysisSeed(
      shares: (0.72, 0.19, 0.09),
      terms: ['capcut', 'legenda automática', 'cortes', 'premiere', 'tempo'],
      comments: [
        AudienceCommentModel(
          author: '@lu.criativa',
          text: 'Faz um vídeo mostrando como você corta os silêncios com IA!',
          sentiment: Sentiment.positive,
        ),
        AudienceCommentModel(
          author: '@marcos_edit',
          text: 'Uso o CapCut mas a legenda erra muito nome próprio.',
          sentiment: Sentiment.neutral,
        ),
      ],
    ),
    'topic-002': _AnalysisSeed(
      shares: (0.48, 0.31, 0.21),
      terms: ['retenção', 'algoritmo', '60 segundos', 'longo', 'inscritos'],
      comments: [
        AudienceCommentModel(
          author: '@ana.paula',
          text: 'Prefiro os vídeos longos, os shorts passam rápido demais.',
          sentiment: Sentiment.negative,
        ),
        AudienceCommentModel(
          author: '@dev.rafa',
          text: 'Shorts me trouxeram aqui, mas fico pelos longos.',
          sentiment: Sentiment.positive,
        ),
      ],
    ),
    'topic-003': _AnalysisSeed(
      shares: (0.66, 0.26, 0.08),
      terms: ['roteiro', 'gravação', 'equipe', 'erros', 'vlog'],
      comments: [
        AudienceCommentModel(
          author: '@carol.s',
          text: 'Mostra os erros de gravação, adoro ver o processo.',
          sentiment: Sentiment.positive,
        ),
        AudienceCommentModel(
          author: '@joao.mkt',
          text: 'Quantas pessoas trabalham com você por vídeo?',
          sentiment: Sentiment.neutral,
        ),
      ],
    ),
    'topic-004': _AnalysisSeed(
      shares: (0.58, 0.30, 0.12),
      terms: ['patrocínio', 'curso', 'afiliado', 'membros', 'valor'],
      comments: [
        AudienceCommentModel(
          author: '@bia.finance',
          text: 'Quanto você cobra por um publi? Fala sem rodeios!',
          sentiment: Sentiment.neutral,
        ),
        AudienceCommentModel(
          author: '@thiago.cria',
          text: 'O clube de membros valeu cada centavo, conteúdo top.',
          sentiment: Sentiment.positive,
        ),
      ],
    ),
    'topic-005': _AnalysisSeed(
      shares: (0.22, 0.36, 0.42),
      terms: ['bloquear', 'ignorar', 'crítica', 'saúde mental', 'moderação'],
      comments: [
        AudienceCommentModel(
          author: '@fer.oliveira',
          text: 'Cansei de ver gente destilando ódio nos comentários.',
          sentiment: Sentiment.negative,
        ),
        AudienceCommentModel(
          author: '@pedro.h',
          text: 'Como você separa crítica construtiva de hate?',
          sentiment: Sentiment.neutral,
        ),
      ],
    ),
    'topic-006': _AnalysisSeed(
      shares: (0.61, 0.28, 0.11),
      terms: ['ring light', 'microfone', 'celular', 'fundo', 'orçamento'],
      comments: [
        AudienceCommentModel(
          author: '@studio.dani',
          text: 'Qual microfone de lapela barato você recomenda?',
          sentiment: Sentiment.neutral,
        ),
        AudienceCommentModel(
          author: '@gui.vlogs',
          text: 'Comecei só com o celular e uma janela, dá certo sim!',
          sentiment: Sentiment.positive,
        ),
      ],
    ),
  };

  @override
  Future<List<TopicModel>> fetchTrendingTopics() async {
    await Future<void>.delayed(AppConstants.mockDataSourceDelay);
    return topics;
  }

  @override
  Future<TopicAnalysisModel> fetchTopicAnalysis(String topicId) async {
    await Future<void>.delayed(AppConstants.mockDataSourceDelay);
    final topic = topics.where((topic) => topic.id == topicId).firstOrNull;
    final seed = _analyses[topicId];
    if (topic == null || seed == null) {
      throw const ServerException(
        message: 'Tópico não encontrado.',
        statusCode: 404,
      );
    }
    final (positive, neutral, negative) = seed.shares;
    return TopicAnalysisModel(
      topic: topic,
      positiveShare: positive,
      neutralShare: neutral,
      negativeShare: negative,
      terms: [
        for (final (index, term) in seed.terms.indexed)
          TopicTermModel(term: term, count: topic.mentions ~/ (index + 2)),
      ],
      comments: seed.comments,
    );
  }
}

/// Dados minimos para montar a analise mockada de um topico.
class _AnalysisSeed {
  const new({
    required this.shares,
    required this.terms,
    required this.comments,
  });

  /// (positivo, neutro, negativo).
  final (double, double, double) shares;

  final List<String> terms;

  final List<AudienceCommentModel> comments;
}
