import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/topics/presentation/pages/topic_analysis_page.dart';
import 'package:influencia/features/topics/presentation/providers/topic_providers.dart';
import 'package:influencia/shared/widgets/app_error_view.dart';

import '../../../helpers/fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('TopicAnalysisPage', () {
    testWidgets('renderiza sentimento, termos, comentarios e o CTA', (
      tester,
    ) async {
      await tester.pumpApp(
        const TopicAnalysisPage(topicId: 't1'),
        overrides: [
          topicDataSourceProvider.overrideWith((ref) => FakeTopicDataSource()),
        ],
      );
      await tester.settleProviders();

      expect(find.text('Rotina de edição com IA'), findsOneWidget);
      expect(find.text('342 menções'), findsOneWidget);
      expect(find.text('Sentimento dos comentários'), findsOneWidget);
      expect(find.text('62%'), findsOneWidget);
      expect(find.text('21%'), findsOneWidget);
      expect(find.text('17%'), findsOneWidget);
      expect(find.text('capcut · 84'), findsOneWidget);
      expect(find.text('@lu.criativa'), findsOneWidget);
      expect(find.text('Faz um vídeo sobre cortes com IA!'), findsOneWidget);
      expect(find.text('Gerar roteiro'), findsOneWidget);
    });

    testWidgets('em erro mostra AppErrorView', (tester) async {
      await tester.pumpApp(
        const TopicAnalysisPage(topicId: 't1'),
        overrides: [
          topicDataSourceProvider.overrideWith(
            (ref) => FakeTopicDataSource(failFirstCalls: 1),
          ),
        ],
      );
      await tester.settleProviders();

      expect(find.byType(AppErrorView), findsOneWidget);
      expect(
        find.text('Não foi possível carregar a análise do tópico.'),
        findsOneWidget,
      );
    });
  });
}
