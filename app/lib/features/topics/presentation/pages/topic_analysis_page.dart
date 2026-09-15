import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/scripts/presentation/widgets/generate_script_button.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';
import 'package:influencia/features/topics/domain/entities/topic_analysis.dart';
import 'package:influencia/features/topics/presentation/providers/topic_providers.dart';
import 'package:influencia/features/topics/presentation/widgets/sentiment_badge.dart';
import 'package:influencia/shared/widgets/async_view.dart';
import 'package:influencia/shared/widgets/section_title.dart';

/// Analise de um topico: sentimento, termos e comentarios da audiencia.
class TopicAnalysisPage extends ConsumerWidget {
  const new({required this.topicId, super.key});

  final String topicId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisAsync = ref.watch(topicAnalysisProvider(topicId));
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.analysisTitle)),
      body: AsyncView(
        value: analysisAsync,
        errorMessage: context.l10n.analysisErrorMessage,
        onRetry: () => ref.invalidate(topicAnalysisProvider(topicId)),
        builder: (analysis) => _AnalysisBody(analysis: analysis),
      ),
    );
  }
}

class _AnalysisBody extends StatelessWidget {
  const new({required this.analysis});

  final TopicAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final topic = analysis.topic;
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            children: [
              Text(
                topic.title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    l10n.mentions(topic.mentions),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SentimentBadge(sentiment: topic.sentimentLabel),
                ],
              ),
              const SizedBox(height: 24),
              SectionTitle(l10n.analysisSentimentSection),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _SentimentBar(
                        sentiment: Sentiment.positive,
                        share: analysis.positiveShare,
                      ),
                      const SizedBox(height: 12),
                      _SentimentBar(
                        sentiment: Sentiment.neutral,
                        share: analysis.neutralShare,
                      ),
                      const SizedBox(height: 12),
                      _SentimentBar(
                        sentiment: Sentiment.negative,
                        share: analysis.negativeShare,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SectionTitle(l10n.analysisTermsSection),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final term in analysis.terms)
                    Chip(
                      label: Text('${term.term} · ${term.count}'),
                      labelStyle: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              SectionTitle(l10n.analysisCommentsSection),
              const SizedBox(height: 12),
              for (final comment in analysis.comments) ...[
                _CommentCard(comment: comment),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: GenerateScriptButton(topicId: topic.id),
          ),
        ),
      ],
    );
  }
}

class _SentimentBar extends StatelessWidget {
  const new({required this.sentiment, required this.share});

  final Sentiment sentiment;

  final double share;

  @override
  Widget build(BuildContext context) {
    final percent = (share * 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sentiment.label(context.l10n),
              style: context.textTheme.bodyMedium,
            ),
            Text(
              '$percent%',
              style: context.textTheme.bodyMedium?.copyWith(
                color: sentiment.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: share,
            minHeight: 8,
            color: sentiment.color,
            backgroundColor: AppColors.inactive,
          ),
        ),
      ],
    );
  }
}

class _CommentCard extends StatelessWidget {
  const new({required this.comment});

  final AudienceComment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comment.author,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SentimentBadge(sentiment: comment.sentiment),
              ],
            ),
            const SizedBox(height: 8),
            Text(comment.text, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
