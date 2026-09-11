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
