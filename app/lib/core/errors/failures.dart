/// Falhas expostas pela camada de dominio para a apresentacao.
///
/// Implementa [Exception] para poder ser lancada dentro de providers e
/// capturada como `AsyncValue.error`.
sealed class Failure implements Exception {
  const new({required this.message});

  final String message;

  @override
  String toString() => message;
}

/// Falha de conectividade com o backend.
final class NetworkFailure extends Failure {
  const new({required super.message});
}

/// O backend respondeu com erro.
final class ServerFailure extends Failure {
  const new({required super.message});
}

/// Erro nao previsto.
final class UnexpectedFailure extends Failure {
  const new({required super.message});
}
