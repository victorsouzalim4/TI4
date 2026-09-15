// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'script_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// keepAlive para que os roteiros gerados persistam durante a sessao.

@ProviderFor(scriptDataSource)
final scriptDataSourceProvider = ScriptDataSourceProvider._();

/// keepAlive para que os roteiros gerados persistam durante a sessao.

final class ScriptDataSourceProvider
    extends
        $FunctionalProvider<
          ScriptDataSource,
          ScriptDataSource,
          ScriptDataSource
        >
    with $Provider<ScriptDataSource> {
  /// keepAlive para que os roteiros gerados persistam durante a sessao.
  ScriptDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scriptDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scriptDataSourceHash();

  @$internal
  @override
  $ProviderElement<ScriptDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScriptDataSource create(Ref ref) {
    return scriptDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScriptDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScriptDataSource>(value),
    );
  }
}

String _$scriptDataSourceHash() => r'9e5b8615c26bc0e8a051012b85736695db8d108c';

@ProviderFor(scriptRepository)
final scriptRepositoryProvider = ScriptRepositoryProvider._();

final class ScriptRepositoryProvider
    extends
        $FunctionalProvider<
          ScriptRepository,
          ScriptRepository,
          ScriptRepository
        >
    with $Provider<ScriptRepository> {
  ScriptRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scriptRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scriptRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScriptRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScriptRepository create(Ref ref) {
    return scriptRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScriptRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScriptRepository>(value),
    );
  }
}

String _$scriptRepositoryHash() => r'f2cda1764d295077604c2b49d014fecad58c158a';

@ProviderFor(scripts)
final scriptsProvider = ScriptsProvider._();

final class ScriptsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Script>>,
          List<Script>,
          FutureOr<List<Script>>
        >
    with $FutureModifier<List<Script>>, $FutureProvider<List<Script>> {
  ScriptsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scriptsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scriptsHash();

  @$internal
  @override
  $FutureProviderElement<List<Script>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Script>> create(Ref ref) {
    return scripts(ref);
  }
}

String _$scriptsHash() => r'df5b4f8d64857f054d2b0621f347baf31582cf13';

@ProviderFor(script)
final scriptProvider = ScriptFamily._();

final class ScriptProvider
    extends $FunctionalProvider<AsyncValue<Script>, Script, FutureOr<Script>>
    with $FutureModifier<Script>, $FutureProvider<Script> {
  ScriptProvider._({
    required ScriptFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'scriptProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scriptHash();

  @override
  String toString() {
    return r'scriptProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Script> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Script> create(Ref ref) {
    final argument = this.argument as String;
    return script(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ScriptProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scriptHash() => r'ea33fa81c4265e0b9b00cb73236c66b3508d9e8d';

final class ScriptFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Script>, String> {
  ScriptFamily._()
    : super(
        retry: null,
        name: r'scriptProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScriptProvider call(String scriptId) =>
      ScriptProvider._(argument: scriptId, from: this);

  @override
  String toString() => r'scriptProvider';
}
