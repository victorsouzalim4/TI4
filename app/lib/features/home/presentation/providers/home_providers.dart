import 'package:dio/dio.dart';
import 'package:influencia/core/network/dio_client.dart';
import 'package:influencia/features/home/data/datasources/mock_topic_data_source.dart';
import 'package:influencia/features/home/data/datasources/topic_data_source.dart';
import 'package:influencia/features/home/data/repositories/topic_repository_impl.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';
import 'package:influencia/features/home/domain/repositories/topic_repository.dart';
import 'package:influencia/features/home/domain/usecases/get_trending_topics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

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
  return result.fold<List<Topic>>(
    onOk: (topics) => topics,
    onErr: (failure) => throw failure,
  );
}
