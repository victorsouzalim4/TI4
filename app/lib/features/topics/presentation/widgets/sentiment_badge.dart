import 'package:flutter/material.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';
import 'package:influencia/l10n/generated/app_localizations.dart';

/// Cor associada a cada [Sentiment] na interface.
extension SentimentX on Sentiment {
  Color get color => switch (this) {
    Sentiment.positive => AppColors.primary,
    Sentiment.neutral => AppColors.textSecondary,
    Sentiment.negative => AppColors.negative,
  };

  String label(AppLocalizations l10n) => switch (this) {
    Sentiment.positive => l10n.sentimentPositive,
    Sentiment.neutral => l10n.sentimentNeutral,
    Sentiment.negative => l10n.sentimentNegative,
  };
}

/// Selo compacto com o rotulo e a cor do sentimento.
class SentimentBadge extends StatelessWidget {
  const new({required this.sentiment, super.key});

  final Sentiment sentiment;

  @override
  Widget build(BuildContext context) {
    final color = sentiment.color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        sentiment.label(context.l10n),
        style: context.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
