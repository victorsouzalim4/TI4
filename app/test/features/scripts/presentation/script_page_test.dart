import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/scripts/presentation/pages/script_page.dart';
import 'package:influencia/features/scripts/presentation/providers/script_providers.dart';

import '../../../helpers/fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  late FakeScriptDataSource dataSource;

  setUp(() {
    dataSource = FakeScriptDataSource();
  });

  Future<void> pumpScript(WidgetTester tester) async {
    await tester.pumpApp(
      const ScriptPage(scriptId: 's1'),
      overrides: [scriptDataSourceProvider.overrideWith((ref) => dataSource)],
    );
    await tester.settleProviders();
  }

  group('ScriptPage', () {
    testWidgets('renderiza gancho, desenvolvimento e chamada para acao', (
      tester,
    ) async {
      await pumpScript(tester);

      expect(find.text('Roteiro'), findsOneWidget);
      expect(find.text('Rotina de edição com IA'), findsOneWidget);
      expect(find.text('“Você edita do jeito errado.”'), findsOneWidget);
      expect(
        find.text('Primeiro parágrafo.\n\nSegundo parágrafo.'),
        findsOneWidget,
      );
      expect(find.text('Comenta aqui.'), findsOneWidget);
      expect(find.text('Copiar'), findsOneWidget);
      expect(find.text('Regenerar'), findsOneWidget);
    });

    testWidgets('regenerar substitui o gancho na tela', (tester) async {
      await pumpScript(tester);

      await tester.tap(find.text('Regenerar'));
      await tester.settleProviders();
      await tester.settleProviders();

      expect(dataSource.regenerations, 1);
      expect(find.text('“Gancho regenerado.”'), findsOneWidget);
    });

    testWidgets('copiar envia o texto completo para a area de transferencia', (
      tester,
    ) async {
      String? copied;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (call) async {
            if (call.method == 'Clipboard.setData') {
              copied =
                  (call.arguments as Map<Object?, Object?>)['text'] as String?;
            }
            return null;
          });
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null),
      );
      await pumpScript(tester);

      await tester.tap(find.text('Copiar'));
      await tester.pump();

      expect(
        copied,
        'Você edita do jeito errado.\n\n'
        'Primeiro parágrafo.\n\nSegundo parágrafo.\n\n'
        'Comenta aqui.',
      );
      expect(find.text('Roteiro copiado'), findsOneWidget);
    });
  });
}
