import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:influencia/shared/widgets/app_error_view.dart';

/// Renderiza um [AsyncValue] com os estados padrao de carregamento e erro.
class AsyncView<T> extends StatelessWidget {
  const new({
    required this.value,
    required this.errorMessage,
    required this.onRetry,
    required this.builder,
    super.key,
  });

  final AsyncValue<T> value;

  final String errorMessage;

  final VoidCallback onRetry;

  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          AppErrorView(message: errorMessage, onRetry: onRetry),
      data: builder,
    );
  }
}
