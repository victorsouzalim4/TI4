import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/profile/domain/entities/profile.dart';
import 'package:influencia/features/profile/presentation/pages/profile_page.dart';

import '../../../helpers/pump_app.dart';

void main() {
  const profile = Profile(
    name: 'Marina Costa',
    handle: '@marinacria',
    niche: 'Criação de conteúdo',
    mainPlatform: 'YouTube',
  );

  group('ProfilePage', () {
    testWidgets('mostra os dados basicos do influenciador', (tester) async {
      await tester.pumpApp(const ProfilePage(profile: profile));

      expect(find.text('Perfil'), findsOneWidget);
      expect(find.text('MC'), findsOneWidget);
      expect(find.text('Marina Costa'), findsOneWidget);
      expect(find.text('@marinacria'), findsOneWidget);
      expect(find.text('Criação de conteúdo'), findsOneWidget);
      expect(find.text('YouTube'), findsOneWidget);
    });
  });

  group('Profile.initials', () {
    test('usa a primeira letra do primeiro e do ultimo nome', () {
      expect(profile.initials, 'MC');
    });

    test('nome unico gera uma letra', () {
      const single = Profile(
        name: 'Marina',
        handle: '@marina',
        niche: '',
        mainPlatform: '',
      );
      expect(single.initials, 'M');
    });
  });
}
