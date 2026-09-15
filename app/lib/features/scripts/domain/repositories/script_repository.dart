import 'package:influencia/core/utils/result.dart';
import 'package:influencia/features/scripts/domain/entities/script.dart';

/// Contrato de acesso aos roteiros gerados.
abstract class ScriptRepository {
  Future<Result<List<Script>>> getScripts();

  Future<Result<Script>> getScript(String scriptId);

  /// Gera um novo roteiro para o topico e o adiciona a lista.
  Future<Result<Script>> generateScript(String topicId);

  /// Gera uma nova versao do roteiro, substituindo o conteudo atual.
  Future<Result<Script>> regenerateScript(String scriptId);
}
