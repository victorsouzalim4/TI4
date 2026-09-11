import 'package:flutter/material.dart';
import 'package:influencia/core/extensions/context_extensions.dart';

/// Visao de erro reutilizavel com mensagem e botao de tentar novamente.
class AppErrorView extends StatelessWidget {
  const new({required this.message, required this.onRetry, super.key});

  final String message;

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: context.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(context.l10n.retryButton),
            ),
          ],
        ),
      ),
    );
  }
}
