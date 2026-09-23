import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';

/// Tela inicial: apresenta o app e deixa entrar sem conta.
class WelcomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            children: [
              const Spacer(),
              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primaryContainer,
                child: Icon(
                  Icons.auto_awesome,
                  size: 40,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.appTitle,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.welcomeTagline,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => context.goNamed(AppRoutes.trendsName),
                child: Text(l10n.welcomeExplore),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => context.pushNamed(AppRoutes.signUpName),
                child: Text(l10n.welcomeSignUp),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.welcomeNoAccountHint,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.pushNamed(AppRoutes.aboutName),
                child: Text(l10n.welcomeAbout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
