import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:influencia/core/config/app_config.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';
import 'package:influencia/features/home/presentation/providers/home_providers.dart';
import 'package:influencia/shared/widgets/app_error_view.dart';

/// Tela inicial com o ranking de topicos em alta da audiencia.
class HomePage extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(trendingTopicsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.homeTitle),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _EnvironmentBadge(),
          ),
        ],
      ),
      body: topicsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => AppErrorView(
          message: context.l10n.homeErrorMessage,
          onRetry: () => ref.invalidate(trendingTopicsProvider),
        ),
        data: (topics) => ListView.separated(
          itemCount: topics.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) => _TopicTile(topic: topics[index]),
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
            style: context.theme.textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  const new({required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(topic.title),
      subtitle: Text(context.l10n.homeMentions(topic.mentions)),
      trailing: Icon(
        _sentimentIcon(topic.sentiment),
        color: context.colorScheme.secondary,
      ),
    );
  }

  IconData _sentimentIcon(double sentiment) {
    if (sentiment >= 0.66) {
      return Icons.sentiment_very_satisfied;
    }
    if (sentiment >= 0.33) {
      return Icons.sentiment_neutral;
    }
    return Icons.sentiment_dissatisfied;
  }
}
