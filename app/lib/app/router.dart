import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/app_shell.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';
import 'package:influencia/features/scripts/presentation/pages/script_page.dart';
import 'package:influencia/features/scripts/presentation/pages/scripts_page.dart';
import 'package:influencia/features/topics/presentation/pages/topic_analysis_page.dart';
import 'package:influencia/features/topics/presentation/pages/trends_page.dart';

/// Caminhos e nomes das rotas do aplicativo.
abstract final class AppRoutes {
  static const String trendsPath = '/trends';
  static const String trendsName = 'trends';

  /// Filha de [trendsPath]: `/trends/:topicId`.
  static const String topicAnalysisPath = ':topicId';
  static const String topicAnalysisName = 'topic-analysis';

  static const String scriptsPath = '/scripts';
  static const String scriptsName = 'scripts';

  /// Filha de [scriptsPath]: `/scripts/:scriptId`.
  static const String scriptPath = ':scriptId';
  static const String scriptName = 'script';

  static const String profilePath = '/profile';
  static const String profileName = 'profile';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Roteador principal do aplicativo.
///
/// As tres abas vivem em um [StatefulShellRoute] (cada aba mantem sua propria
/// pilha). A tela de roteiro abre no navigator raiz para cobrir a bottom bar.
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.trendsPath,
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
              builder: (context, state) => const TrendsPage(),
              routes: [
                GoRoute(
                  path: AppRoutes.topicAnalysisPath,
                  name: AppRoutes.topicAnalysisName,
                  builder: (context, state) => TopicAnalysisPage(
                    topicId: state.pathParameters['topicId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.scriptsPath,
              name: AppRoutes.scriptsName,
              builder: (context, state) => const ScriptsPage(),
              routes: [
                GoRoute(
                  path: AppRoutes.scriptPath,
                  name: AppRoutes.scriptName,
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) =>
                      ScriptPage(scriptId: state.pathParameters['scriptId']!),
                ),
              ],
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
