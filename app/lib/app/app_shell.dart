import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';

/// Estrutura das abas principais: corpo da aba ativa + bottom bar animada.
class AppShell extends StatelessWidget {
  const new({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      (icon: Icons.trending_up_rounded, label: context.l10n.tabTrends),
      (icon: Icons.description_outlined, label: context.l10n.tabScripts),
      (icon: Icons.person_outline_rounded, label: context.l10n.tabProfile),
    ];

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: tabs.length,
        activeIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        gapLocation: GapLocation.none,
        backgroundColor: AppColors.surface,
        splashColor: AppColors.primaryContainer,
        borderColor: AppColors.border,
        borderWidth: 1,
        elevation: 0,
        height: 68,
        tabBuilder: (index, isActive) {
          final tab = tabs[index];
          final color = isActive ? AppColors.primary : AppColors.textMuted;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(tab.icon, color: color, size: 26),
              const SizedBox(height: 4),
              Text(
                tab.label,
                style: context.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
