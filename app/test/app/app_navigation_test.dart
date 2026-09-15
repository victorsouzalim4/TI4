import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/app/app.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';
import 'package:influencia/features/profile/presentation/providers/profile_providers.dart';
import 'package:influencia/features/scripts/presentation/pages/script_page.dart';
import 'package:influencia/features/scripts/presentation/pages/scripts_page.dart';
import 'package:influencia/features/scripts/presentation/providers/script_providers.dart';
import 'package:influencia/features/topics/presentation/pages/topic_analysis_page.dart';
import 'package:influencia/features/topics/presentation/pages/trends_page.dart';
import 'package:influencia/features/topics/presentation/providers/topic_providers.dart';

import '../helpers/fakes.dart';

void main() {
  late FakeScriptDataSource scriptDataSource;

  setUp(() {
    scriptDataSource = FakeScriptDataSource();
    // O roteador e global: garante que cada teste comece na aba inicial.
    appRouter.go(AppRoutes.trendsPath);
  });

  Future<void> pumpFullApp(WidgetTester tester) async {
    // O App usa o locale do dispositivo; fixa pt para bater com os textos.
    tester.platformDispatcher.localesTestValue = const [Locale('pt')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);
    await tester.pumpWidget(
      ProviderScope(
        retry: (retryCount, error) => null,
        overrides: [
          topicDataSourceProvider.overrideWith((ref) => FakeTopicDataSource()),
          scriptDataSourceProvider.overrideWith((ref) => scriptDataSource),
          profileDataSourceProvider.overrideWith(
            (ref) => FakeProfileDataSource(),
          ),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('Navegacao', () {
    testWidgets('abre na aba Tendencias e alterna pela bottom bar', (
      tester,
    ) async {
      await pumpFullApp(tester);

      expect(find.byType(TrendsPage), findsOneWidget);

      await tester.tap(find.text('Roteiros'));
      await tester.pumpAndSettle();
      expect(find.byType(ScriptsPage), findsOneWidget);

      await tester.tap(find.text('Perfil'));
      await tester.pumpAndSettle();
      expect(find.byType(ProfilePage), findsOneWidget);

      await tester.tap(find.text('Tendências').last);
      await tester.pumpAndSettle();
      expect(find.byType(TrendsPage), findsOneWidget);
    });

    testWidgets('fluxo completo: topico -> analise -> gerar -> roteiro', (
      tester,
    ) async {
      await pumpFullApp(tester);

      await tester.tap(find.text('Rotina de edição com IA'));
      await tester.pumpAndSettle();
      expect(find.byType(TopicAnalysisPage), findsOneWidget);
      expect(find.text('Sentimento dos comentários'), findsOneWidget);

      await tester.tap(find.text('Gerar roteiro'));
      await tester.pumpAndSettle();
      expect(find.byType(ScriptPage), findsOneWidget);
      expect(find.text('“Você edita do jeito errado.”'), findsOneWidget);
      expect(scriptDataSource.scripts.last.id, 'novo');

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.byType(TopicAnalysisPage), findsOneWidget);
    });

    testWidgets('roteiro abre em tela cheia, sem a bottom bar', (tester) async {
      await pumpFullApp(tester);

      await tester.tap(find.text('Roteiros'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Shorts vs vídeos longos'));
      await tester.pumpAndSettle();

      expect(find.byType(ScriptPage), findsOneWidget);
      expect(find.text('Perfil'), findsNothing);
    });
  });
}
