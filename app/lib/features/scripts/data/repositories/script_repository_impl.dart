import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/scripts/data/datasources/script_data_source.dart';
import 'package:influencia/features/scripts/domain/entities/script.dart';
import 'package:influencia/features/scripts/domain/repositories/script_repository.dart';

/// Implementacao de [ScriptRepository] baseada em um [ScriptDataSource].
class ScriptRepositoryImpl implements ScriptRepository {
  const new(this._dataSource);

  final ScriptDataSource _dataSource;

  @override
  Future<Result<List<Script>>> getScripts() {
    return guard(() async {
      final models = await _dataSource.fetchScripts();
      return models.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<Result<Script>> getScript(String scriptId) {
    return guard(() async {
      final model = await _dataSource.fetchScript(scriptId);
      return model.toEntity();
    });
  }

  @override
  Future<Result<Script>> generateScript(String topicId) {
    return guard(() async {
      final model = await _dataSource.createScript(topicId);
      return model.toEntity();
    });
  }

  @override
  Future<Result<Script>> regenerateScript(String scriptId) {
    return guard(() async {
      final model = await _dataSource.regenerateScript(scriptId);
      return model.toEntity();
    });
  }
}
