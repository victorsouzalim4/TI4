import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/auth/presentation/pages/sign_up_page.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('SignUpPage', () {
    testWidgets('mostra os campos e o botao de cadastro', (tester) async {
      await tester.pumpApp(const SignUpPage());

      expect(find.text('Criar conta'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.text('Cadastrar'), findsOneWidget);
    });

    testWidgets('valida os campos vazios ao enviar', (tester) async {
      await tester.pumpApp(const SignUpPage());

      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Informe seu nome.'), findsOneWidget);
      expect(find.text('Informe um e-mail válido.'), findsOneWidget);
      expect(
        find.text('A senha precisa ter pelo menos 6 caracteres.'),
        findsOneWidget,
      );
    });

    testWidgets('rejeita e-mail sem arroba', (tester) async {
      await tester.pumpApp(const SignUpPage());

      await tester.enterText(find.byType(TextFormField).at(0), 'Marina');
      await tester.enterText(find.byType(TextFormField).at(1), 'marina.com');
      await tester.enterText(find.byType(TextFormField).at(2), '123456');
      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Informe seu nome.'), findsNothing);
      expect(find.text('Informe um e-mail válido.'), findsOneWidget);
    });
  });
}
