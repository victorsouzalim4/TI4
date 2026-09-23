import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';
import 'package:influencia/features/profile/presentation/providers/profile_providers.dart';
import 'package:influencia/shared/widgets/async_view.dart';
import 'package:influencia/shared/widgets/section_title.dart';
import 'package:intl/intl.dart';

/// Aba de perfil: dados do influenciador e plataformas conectadas.
class ProfilePage extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profileTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: context.l10n.profileAboutTooltip,
            onPressed: () => context.pushNamed(AppRoutes.aboutName),
          ),
        ],
      ),
      body: AsyncView(
        value: profileAsync,
        errorMessage: context.l10n.profileErrorMessage,
        onRetry: () => ref.invalidate(profileProvider),
        builder: (profile) => _ProfileBody(profile: profile),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const new({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final numberFormat = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toString(),
    );
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        _ProfileHeader(profile: profile),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: l10n.profileCommentsAnalyzed,
                value: numberFormat.format(profile.commentsAnalyzed),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: l10n.profileScriptsGenerated,
                value: numberFormat.format(profile.scriptsGenerated),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SectionTitle(l10n.profilePlatformsSection),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              for (final (index, connection) in profile.platforms.indexed) ...[
                if (index > 0) const Divider(),
                _PlatformTile(connection: connection),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        SectionTitle(l10n.profileStyleSection),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.auto_awesome, color: AppColors.primary),
            title: Text(profile.scriptTone),
            subtitle: Text(
              l10n.profileStyleHint,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const new({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.primaryContainer,
          child: Text(
            profile.initials,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                profile.handle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                profile.niche,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const new({required this.label, required this.value});

  final String label;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: context.textTheme.headlineSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformTile extends StatelessWidget {
  const new({required this.connection});

  final PlatformConnection connection;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (icon, name) = switch (connection.platform) {
      SocialPlatform.youtube => (Icons.play_circle_outline, 'YouTube'),
      SocialPlatform.instagram => (Icons.camera_alt_outlined, 'Instagram'),
      SocialPlatform.tiktok => (Icons.music_note_outlined, 'TikTok'),
    };
    return ListTile(
      leading: Icon(
        icon,
        color: connection.isConnected ? AppColors.primary : AppColors.textMuted,
      ),
      title: Text(name),
      subtitle: Text(
        connection.handle ?? l10n.profileNotConnected,
        style: context.textTheme.bodySmall?.copyWith(
          color: AppColors.textMuted,
        ),
      ),
      trailing: connection.isConnected
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : TextButton(
              // Conexao real chega com as APIs sociais (Sprint 3+).
              onPressed: () => context.showSnackBar(l10n.profileConnectSoon),
              child: Text(l10n.profileConnect),
            ),
    );
  }
}
