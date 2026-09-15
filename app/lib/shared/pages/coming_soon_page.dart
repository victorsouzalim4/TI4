import 'package:flutter/material.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';

/// Tela de espera para as abas que ainda nao entraram no MVP.
class ComingSoonPage extends StatelessWidget {
  const new({required this.title, required this.icon, super.key});

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 56, color: AppColors.primaryMuted),
              const SizedBox(height: 16),
              Text(
                l10n.comingSoonTitle,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.comingSoonMessage,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
