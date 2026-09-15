import 'package:influencia/features/scripts/data/models/script_model.dart';

/// Contrato das fontes de dados de roteiros.
abstract class ScriptDataSource {
  Future<List<ScriptModel>> fetchScripts();

  Future<ScriptModel> fetchScript(String scriptId);

  Future<ScriptModel> createScript(String topicId);

  Future<ScriptModel> regenerateScript(String scriptId);
}
