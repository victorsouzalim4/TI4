import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/scripts/presentation/pages/scripts_page.dart';
import 'package:influencia/features/scripts/presentation/providers/script_providers.dart';

import '../../../helpers/fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('ScriptsPage', () {
    testWidgets('lista os roteiros com titulo, gancho e data', (tester) async {
      await tester.pumpApp(
        const ScriptsPage(),
        overrides: [
          scriptDataSourceProvider.overrideWith(
            (ref) => FakeScriptDataSource(),
          ),
        ],
      );
      await tester.settleProviders();

      expect(find.text('Roteiros'), findsOneWidget);
      expect(find.text('Rotina de edição com IA'), findsOneWidget);
      expect(find.text('Você edita do jeito errado.'), findsOneWidget);
      expect(find.text('Gerado em 10/09/2026'), findsOneWidget);
      expect(find.text('Shorts vs vídeos longos'), findsOneWidget);
    });

    testWidgets('sem roteiros mostra o estado vazio', (tester) async {
      await tester.pumpApp(
        const ScriptsPage(),
        overrides: [
          scriptDataSourceProvider.overrideWith(
            (ref) => FakeScriptDataSource(scripts: []),
          ),
        ],
      );
      await tester.settleProviders();

      expect(find.text('Nenhum roteiro ainda'), findsOneWidget);
    });
  });
}
