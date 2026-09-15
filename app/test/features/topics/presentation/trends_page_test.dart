import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/topics/presentation/pages/trends_page.dart';
import 'package:influencia/features/topics/presentation/providers/topic_providers.dart';
import 'package:influencia/shared/widgets/app_error_view.dart';

import '../../../helpers/fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  Future<void> pumpTrends(WidgetTester tester, FakeTopicDataSource dataSource) {
    return tester.pumpApp(
      const TrendsPage(),
      overrides: [topicDataSourceProvider.overrideWith((ref) => dataSource)],
    );
  }

  group('TrendsPage', () {
    testWidgets('mostra indicador de carregamento inicialmente', (
      tester,
    ) async {
      await pumpTrends(tester, FakeTopicDataSource());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.settleProviders();
    });

    testWidgets('renderiza ranking, titulos, mencoes e sentimento', (
      tester,
    ) async {
      await pumpTrends(tester, FakeTopicDataSource());
      await tester.settleProviders();

      expect(find.text('Tendências'), findsOneWidget);
      expect(find.text('Em alta na sua audiência'), findsOneWidget);
      expect(find.text('01'), findsOneWidget);
      expect(find.text('Rotina de edição com IA'), findsOneWidget);
      expect(find.text('342 menções'), findsOneWidget);
      expect(find.text('Positivo'), findsOneWidget);
      expect(find.text('Neutro'), findsOneWidget);
    });

    testWidgets('em erro mostra AppErrorView e o retry recarrega', (
      tester,
    ) async {
      final dataSource = FakeTopicDataSource(failFirstCalls: 1);
      await pumpTrends(tester, dataSource);
      await tester.settleProviders();

      expect(find.byType(AppErrorView), findsOneWidget);
      expect(
        find.text('Não foi possível carregar os tópicos em alta.'),
        findsOneWidget,
      );

      await tester.tap(find.text('Tentar novamente'));
      await tester.settleProviders();

      expect(find.byType(AppErrorView), findsNothing);
      expect(find.text('Rotina de edição com IA'), findsOneWidget);
      expect(dataSource.calls, 2);
    });
  });
}
