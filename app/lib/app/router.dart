import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/app_shell.dart';
import 'package:influencia/features/about/presentation/pages/about_page.dart';
import 'package:influencia/features/auth/presentation/pages/sign_up_page.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';
import 'package:influencia/features/scripts/presentation/pages/script_page.dart';
import 'package:influencia/features/scripts/presentation/pages/scripts_page.dart';
import 'package:influencia/features/topics/presentation/pages/topic_analysis_page.dart';
import 'package:influencia/features/topics/presentation/pages/trends_page.dart';
import 'package:influencia/features/welcome/presentation/pages/welcome_page.dart';

/// Caminhos e nomes das rotas do aplicativo.
abstract final class AppRoutes {
  static const String welcomePath = '/';
  static const String welcomeName = 'welcome';

  static const String signUpPath = '/signup';
  static const String signUpName = 'sign-up';

  static const String aboutPath = '/about';
  static const String aboutName = 'about';

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
/// O app abre na tela inicial (boas-vindas), que leva as abas sem exigir
/// conta. Cadastro e Sobre sao telas simples fora da bottom bar.
///
/// As tres abas vivem em um [StatefulShellRoute] (cada aba mantem sua propria
/// pilha). A tela de roteiro abre no navigator raiz para cobrir a bottom bar.
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.welcomePath,
  routes: [
    GoRoute(
      path: AppRoutes.welcomePath,
      name: AppRoutes.welcomeName,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: AppRoutes.signUpPath,
      name: AppRoutes.signUpName,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: AppRoutes.aboutPath,
      name: AppRoutes.aboutName,
      builder: (context, state) => const AboutPage(),
    ),
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
