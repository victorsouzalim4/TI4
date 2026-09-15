// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'99cdb11cbe1c21ae80d9077be9866f8384b163b0';

@ProviderFor(topicDataSource)
final topicDataSourceProvider = TopicDataSourceProvider._();

final class TopicDataSourceProvider
    extends
        $FunctionalProvider<TopicDataSource, TopicDataSource, TopicDataSource>
    with $Provider<TopicDataSource> {
  TopicDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topicDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topicDataSourceHash();

  @$internal
  @override
  $ProviderElement<TopicDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TopicDataSource create(Ref ref) {
    return topicDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopicDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopicDataSource>(value),
    );
  }
}

String _$topicDataSourceHash() => r'd93f990aa2517c90d73ecabeb7673daf801aef45';

@ProviderFor(topicRepository)
final topicRepositoryProvider = TopicRepositoryProvider._();

final class TopicRepositoryProvider
    extends
        $FunctionalProvider<TopicRepository, TopicRepository, TopicRepository>
    with $Provider<TopicRepository> {
  TopicRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topicRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topicRepositoryHash();

  @$internal
  @override
  $ProviderElement<TopicRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TopicRepository create(Ref ref) {
    return topicRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopicRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopicRepository>(value),
    );
  }
}

String _$topicRepositoryHash() => r'3eda8aa275649fa1a8241c073052b88156a77f84';

@ProviderFor(getTrendingTopics)
final getTrendingTopicsProvider = GetTrendingTopicsProvider._();

final class GetTrendingTopicsProvider
    extends
        $FunctionalProvider<
          GetTrendingTopics,
          GetTrendingTopics,
          GetTrendingTopics
        >
    with $Provider<GetTrendingTopics> {
  GetTrendingTopicsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTrendingTopicsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTrendingTopicsHash();

  @$internal
  @override
  $ProviderElement<GetTrendingTopics> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTrendingTopics create(Ref ref) {
    return getTrendingTopics(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTrendingTopics value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTrendingTopics>(value),
    );
  }
}

String _$getTrendingTopicsHash() => r'24b31b5b0d42f2426680e16346f19efc25a20f97';

@ProviderFor(trendingTopics)
final trendingTopicsProvider = TrendingTopicsProvider._();

final class TrendingTopicsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Topic>>,
          List<Topic>,
          FutureOr<List<Topic>>
        >
    with $FutureModifier<List<Topic>>, $FutureProvider<List<Topic>> {
  TrendingTopicsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trendingTopicsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trendingTopicsHash();

  @$internal
  @override
  $FutureProviderElement<List<Topic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Topic>> create(Ref ref) {
    return trendingTopics(ref);
  }
}

String _$trendingTopicsHash() => r'b3b03e2223ca8575d4d5ae3d1c943ecbcfe4c3b7';

@ProviderFor(topicAnalysis)
final topicAnalysisProvider = TopicAnalysisFamily._();

final class TopicAnalysisProvider
    extends
        $FunctionalProvider<
          AsyncValue<TopicAnalysis>,
          TopicAnalysis,
          FutureOr<TopicAnalysis>
        >
    with $FutureModifier<TopicAnalysis>, $FutureProvider<TopicAnalysis> {
  TopicAnalysisProvider._({
    required TopicAnalysisFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'topicAnalysisProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topicAnalysisHash();

  @override
  String toString() {
    return r'topicAnalysisProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TopicAnalysis> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TopicAnalysis> create(Ref ref) {
    final argument = this.argument as String;
    return topicAnalysis(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TopicAnalysisProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topicAnalysisHash() => r'40454163920031826b960ea29e951d2eaed5bbea';

final class TopicAnalysisFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TopicAnalysis>, String> {
  TopicAnalysisFamily._()
    : super(
        retry: null,
        name: r'topicAnalysisProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TopicAnalysisProvider call(String topicId) =>
      TopicAnalysisProvider._(argument: topicId, from: this);

  @override
  String toString() => r'topicAnalysisProvider';
}
