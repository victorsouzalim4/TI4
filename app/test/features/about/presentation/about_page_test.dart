import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/about/presentation/pages/about_page.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('AboutPage', () {
    testWidgets('mostra nome, versao e como o app funciona', (tester) async {
      await tester.pumpApp(const AboutPage());

      expect(find.text('Sobre o app'), findsOneWidget);
      expect(find.text('InfluencIA'), findsOneWidget);
      expect(find.text('Versão 1.0.0'), findsOneWidget);
      expect(find.text('Como funciona'), findsOneWidget);
      expect(find.text('Projeto'), findsOneWidget);
      expect(find.text('Trabalho Interdisciplinar IV'), findsOneWidget);
    });
  });
}
