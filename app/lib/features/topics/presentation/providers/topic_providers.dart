import 'package:dio/dio.dart';
import 'package:influencia/core/network/dio_client.dart';
import 'package:influencia/features/topics/data/datasources/mock_topic_data_source.dart';
import 'package:influencia/features/topics/data/datasources/topic_data_source.dart';
import 'package:influencia/features/topics/data/repositories/topic_repository_impl.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';
import 'package:influencia/features/topics/domain/entities/topic_analysis.dart';
import 'package:influencia/features/topics/domain/repositories/topic_repository.dart';
import 'package:influencia/features/topics/domain/usecases/get_trending_topics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topic_providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) => createDioClient();

@riverpod
TopicDataSource topicDataSource(Ref ref) {
  // Trocar por RemoteTopicDataSource(ref.watch(dioProvider)) quando o
  // backend Vortex estiver no ar.
  return MockTopicDataSource();
}

@riverpod
TopicRepository topicRepository(Ref ref) {
  return TopicRepositoryImpl(ref.watch(topicDataSourceProvider));
}

@riverpod
GetTrendingTopics getTrendingTopics(Ref ref) {
  return GetTrendingTopics(ref.watch(topicRepositoryProvider));
}

@riverpod
Future<List<Topic>> trendingTopics(Ref ref) async {
  final usecase = ref.watch(getTrendingTopicsProvider);
  final result = await usecase();
  return result.getOrThrow();
}

@riverpod
Future<TopicAnalysis> topicAnalysis(Ref ref, String topicId) async {
  final repository = ref.watch(topicRepositoryProvider);
  final result = await repository.getTopicAnalysis(topicId);
  return result.getOrThrow();
}
