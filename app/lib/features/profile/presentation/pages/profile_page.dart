import 'package:flutter/material.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/profile/data/demo_profile.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';
import 'package:influencia/shared/widgets/section_title.dart';

/// Aba de perfil: dados basicos do influenciador.
class ProfilePage extends StatelessWidget {
  const new({this.profile = demoProfile, super.key});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _ProfileHeader(profile: profile),
          const SizedBox(height: 24),
          SectionTitle(l10n.profileAboutSection),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.category_outlined,
                    color: AppColors.primary,
                  ),
                  title: Text(l10n.profileNicheLabel),
                  subtitle: Text(profile.niche),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.play_circle_outline,
                    color: AppColors.primary,
                  ),
                  title: Text(l10n.profilePlatformLabel),
                  subtitle: Text(profile.mainPlatform),
                ),
              ],
            ),
          ),
        ],
      ),
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
            ],
          ),
        ),
      ],
    );
  }
}
