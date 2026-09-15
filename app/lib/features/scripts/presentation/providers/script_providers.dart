import 'package:influencia/features/scripts/data/datasources/mock_script_data_source.dart';
import 'package:influencia/features/scripts/data/datasources/script_data_source.dart';
import 'package:influencia/features/scripts/data/repositories/script_repository_impl.dart';
import 'package:influencia/features/scripts/domain/entities/script.dart';
import 'package:influencia/features/scripts/domain/repositories/script_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'script_providers.g.dart';

/// keepAlive para que os roteiros gerados persistam durante a sessao.
@Riverpod(keepAlive: true)
ScriptDataSource scriptDataSource(Ref ref) {
  // Trocar por RemoteScriptDataSource(ref.watch(dioProvider)) quando o
  // backend Vortex estiver no ar.
  return MockScriptDataSource();
}

@riverpod
ScriptRepository scriptRepository(Ref ref) {
  return ScriptRepositoryImpl(ref.watch(scriptDataSourceProvider));
}

@riverpod
Future<List<Script>> scripts(Ref ref) async {
  final result = await ref.watch(scriptRepositoryProvider).getScripts();
  return result.getOrThrow();
}

@riverpod
Future<Script> script(Ref ref, String scriptId) async {
  final result = await ref.watch(scriptRepositoryProvider).getScript(scriptId);
  return result.getOrThrow();
}
