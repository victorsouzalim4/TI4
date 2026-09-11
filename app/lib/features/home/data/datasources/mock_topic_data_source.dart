import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/features/home/data/datasources/topic_data_source.dart';
import 'package:influencia/features/home/data/models/topic_model.dart';

/// Fonte de dados em memoria usada enquanto o backend Vortex nao existe.
class MockTopicDataSource implements TopicDataSource {
  static const List<TopicModel> _topics = [
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

  @override
  Future<List<TopicModel>> fetchTrendingTopics() async {
    await Future<void>.delayed(AppConstants.mockDataSourceDelay);
    return _topics;
  }
}
