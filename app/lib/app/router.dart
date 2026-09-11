import 'package:go_router/go_router.dart';
import 'package:influencia/features/home/presentation/pages/home_page.dart';

/// Caminhos e nomes das rotas do aplicativo.
abstract final class AppRoutes {
  static const String homePath = '/';

  static const String homeName = 'home';
}

/// Roteador principal do aplicativo.
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.homePath,
      name: AppRoutes.homeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
