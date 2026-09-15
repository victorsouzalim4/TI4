import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/core/errors/failures.dart';

/// Resultado de uma operacao que pode falhar com uma [Failure].
sealed class Result<T> {
  const new();

  bool get isOk => this is Ok<T>;

  bool get isErr => this is Err<T>;

  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Failure failure) onErr,
  }) {
    return switch (this) {
      Ok<T>(:final value) => onOk(value),
      Err<T>(:final failure) => onErr(failure),
    };
  }

  Result<R> map<R>(R Function(T value) transform) {
    return switch (this) {
      Ok<T>(:final value) => Ok<R>(transform(value)),
      Err<T>(:final failure) => Err<R>(failure),
    };
  }

  /// Retorna o valor ou lanca a [Failure]. Util dentro de providers, onde a
  /// falha vira `AsyncValue.error`.
  T getOrThrow() {
    return switch (this) {
      Ok<T>(:final value) => value,
      Err<T>(:final failure) => throw failure,
    };
  }
}

/// Operacao concluida com sucesso, carregando [value].
final class Ok<T> extends Result<T> {
  const new(this.value);

  final T value;
}

/// Operacao que falhou, carregando a [failure] correspondente.
final class Err<T> extends Result<T> {
  const new(this.failure);

  final Failure failure;
}

/// Executa [action] e converte qualquer excecao na [Failure] equivalente.
///
/// Usado pelos repositorios para transformar as excecoes dos datasources
/// em um [Result] sem repetir o mesmo try/catch em cada metodo.
Future<Result<T>> guard<T>(Future<T> Function() action) async {
  try {
    return Ok(await action());
  } on AppException catch (exception) {
    return Err(Failure.fromException(exception));
  } on Exception catch (exception) {
    return Err(UnexpectedFailure(message: exception.toString()));
  }
}
