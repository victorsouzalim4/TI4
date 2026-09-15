import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/app/app.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';
import 'package:influencia/shared/pages/coming_soon_page.dart';

void main() {
  setUp(() {
    // O roteador e global: garante que cada teste comece na aba inicial.
    appRouter.go(AppRoutes.profilePath);
  });

  Future<void> pumpFullApp(WidgetTester tester) async {
    // O App usa o locale do dispositivo; fixa pt para bater com os textos.
    tester.platformDispatcher.localesTestValue = const [Locale('pt')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
  }

  group('Navegacao', () {
    testWidgets('abre no perfil e alterna pela bottom bar', (tester) async {
      await pumpFullApp(tester);

      expect(find.byType(ProfilePage), findsOneWidget);

      await tester.tap(find.text('Tendências'));
      await tester.pumpAndSettle();
      expect(find.byType(ComingSoonPage), findsOneWidget);
      expect(find.text('Em breve'), findsOneWidget);

      await tester.tap(find.text('Roteiros').last);
      await tester.pumpAndSettle();
      expect(find.byType(ComingSoonPage), findsOneWidget);

      await tester.tap(find.text('Perfil').last);
      await tester.pumpAndSettle();
      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
