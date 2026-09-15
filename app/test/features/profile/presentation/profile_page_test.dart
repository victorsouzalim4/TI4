import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';
import 'package:influencia/features/profile/presentation/providers/profile_providers.dart';

import '../../../helpers/fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('ProfilePage', () {
    testWidgets('renderiza dados, estatisticas e plataformas', (tester) async {
      await tester.pumpApp(
        const ProfilePage(),
        overrides: [
          profileDataSourceProvider.overrideWith(
            (ref) => FakeProfileDataSource(),
          ),
        ],
      );
      await tester.settleProviders();

      expect(find.text('Perfil'), findsOneWidget);
      expect(find.text('MC'), findsOneWidget);
      expect(find.text('Marina Costa'), findsOneWidget);
      expect(find.text('12.480'), findsOneWidget);
      expect(find.text('Comentários analisados'), findsOneWidget);
      expect(find.text('YouTube'), findsOneWidget);
      expect(find.text('TikTok'), findsOneWidget);
      expect(find.text('Não conectado'), findsOneWidget);
      expect(find.text('Descontraído'), findsOneWidget);

      await tester.tap(find.text('Conectar'));
      await tester.pump();

      expect(
        find.text('A conexão com as plataformas chega em breve.'),
        findsOneWidget,
      );
    });
  });

  group('Profile.initials', () {
    test('usa a primeira letra do primeiro e do ultimo nome', () {
      expect(fakeProfile.toEntity().initials, 'MC');
    });

    test('nome unico gera uma letra', () {
      final profile = fakeProfile.copyWith(name: 'Marina').toEntity();
      expect(profile.initials, 'M');
    });
  });
}
