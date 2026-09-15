import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/config/app_config.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';
import 'package:influencia/features/topics/presentation/providers/topic_providers.dart';
import 'package:influencia/features/topics/presentation/widgets/sentiment_badge.dart';
import 'package:influencia/shared/widgets/async_view.dart';

/// Aba inicial com o ranking de topicos em alta da audiencia.
class TrendsPage extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(trendingTopicsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.trendsTitle),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _EnvironmentBadge(),
          ),
        ],
      ),
      body: AsyncView(
        value: topicsAsync,
        errorMessage: context.l10n.trendsErrorMessage,
        onRetry: () => ref.invalidate(trendingTopicsProvider),
        builder: (topics) => ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: topics.length + 1,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  context.l10n.trendsSubtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            }
            return _TopicCard(rank: index, topic: topics[index - 1]);
          },
        ),
      ),
    );
  }
}

class _EnvironmentBadge extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.l10n.environmentBadgeLabel(AppConfig.appEnv),
      child: Center(
        child: Chip(
          visualDensity: VisualDensity.compact,
          label: Text(
            AppConfig.appEnv.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}

class _TopicCard extends StatelessWidget {
  const new({required this.rank, required this.topic});

  final int rank;

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.goNamed(
          AppRoutes.topicAnalysisName,
          pathParameters: {'topicId': topic.id},
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                rank.toString().padLeft(2, '0'),
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          context.l10n.mentions(topic.mentions),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SentimentBadge(sentiment: topic.sentimentLabel),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
