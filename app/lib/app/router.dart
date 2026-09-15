import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/app_shell.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';
import 'package:influencia/shared/pages/coming_soon_page.dart';

/// Caminhos e nomes das rotas do aplicativo.
abstract final class AppRoutes {
  static const String trendsPath = '/trends';
  static const String trendsName = 'trends';

  static const String scriptsPath = '/scripts';
  static const String scriptsName = 'scripts';

  static const String profilePath = '/profile';
  static const String profileName = 'profile';
}

/// Roteador principal do aplicativo.
///
/// As tres abas vivem em um [StatefulShellRoute] (cada aba mantem sua propria
/// pilha). Neste MVP apenas a aba de perfil tem conteudo; as outras duas
/// mostram uma tela de espera.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.profilePath,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.trendsPath,
              name: AppRoutes.trendsName,
              builder: (context, state) => ComingSoonPage(
                title: context.l10n.tabTrends,
                icon: Icons.trending_up_rounded,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.scriptsPath,
              name: AppRoutes.scriptsName,
              builder: (context, state) => ComingSoonPage(
                title: context.l10n.tabScripts,
                icon: Icons.description_outlined,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profilePath,
              name: AppRoutes.profileName,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
