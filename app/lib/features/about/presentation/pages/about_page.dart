import 'package:flutter/material.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/constants/app_constants.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/shared/widgets/section_title.dart';

/// Tela "Sobre o app": o que o InfluencIA faz e de onde ele vem.
class AboutPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final steps = [l10n.aboutStep1, l10n.aboutStep2, l10n.aboutStep3];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryContainer,
                child: Icon(
                  Icons.auto_awesome,
                  size: 28,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.appTitle,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    l10n.aboutVersion(AppConstants.appVersion),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.aboutDescription,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          SectionTitle(l10n.aboutHowItWorksSection),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                for (final (index, step) in steps.indexed) ...[
                  if (index > 0) const Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.primaryContainer,
                      child: Text(
                        '${index + 1}',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    title: Text(step),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionTitle(l10n.aboutProjectSection),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.school_outlined,
                color: AppColors.primary,
              ),
              title: Text(l10n.aboutProjectName),
              subtitle: Text(
                l10n.aboutProjectDescription,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
