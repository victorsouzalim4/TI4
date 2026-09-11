/// Excecoes lancadas pela camada de dados.
sealed class AppException implements Exception {
  const new({required this.message, this.statusCode});

  final String message;

  final int? statusCode;

  @override
  String toString() => '$message (statusCode: $statusCode)';
}

/// Falha de conectividade: timeout, sem rede, conexao recusada.
final class NetworkException extends AppException {
  const new({required super.message});
}

/// O servidor respondeu com um status de erro.
final class ServerException extends AppException {
  const new({required super.message, super.statusCode});
}

/// Qualquer outro erro nao previsto.
final class UnexpectedException extends AppException {
  const new({required super.message});
}
