import 'package:influencia/core/errors/exceptions.dart';

/// Falhas expostas pela camada de dominio para a apresentacao.
///
/// Implementa [Exception] para poder ser lancada dentro de providers e
/// capturada como `AsyncValue.error`.
sealed class Failure implements Exception {
  const new({required this.message});

  /// Converte uma [AppException] da camada de dados na [Failure] equivalente.
  factory fromException(AppException exception) {
    return switch (exception) {
      NetworkException(:final message) => NetworkFailure(message: message),
      ServerException(:final message) => ServerFailure(message: message),
      UnexpectedException(:final message) => UnexpectedFailure(
        message: message,
      ),
    };
  }

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
