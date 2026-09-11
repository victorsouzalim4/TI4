import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/core/errors/exceptions.dart';
import 'package:influencia/features/home/data/datasources/topic_data_source.dart';
import 'package:influencia/features/home/data/models/topic_model.dart';
import 'package:influencia/features/home/presentation/pages/home_page.dart';
import 'package:influencia/features/home/presentation/providers/home_providers.dart';
import 'package:influencia/l10n/generated/app_localizations.dart';
import 'package:influencia/shared/widgets/app_error_view.dart';

class _SuccessTopicDataSource implements TopicDataSource {
  @override
  Future<List<TopicModel>> fetchTrendingTopics() async {
    return const [
      TopicModel(
        id: 't1',
        title: 'Rotina de edição com IA',
        mentions: 342,
        sentiment: 0.86,
      ),
      TopicModel(
        id: 't2',
        title: 'Shorts vs vídeos longos',
        mentions: 289,
        sentiment: 0.61,
      ),
    ];
  }
}

/// Falha na primeira chamada e responde com sucesso a partir da segunda.
class _FlakyTopicDataSource implements TopicDataSource {
  int calls = 0;

  @override
  Future<List<TopicModel>> fetchTrendingTopics() async {
    calls++;
    if (calls == 1) {
      throw const NetworkException(message: 'sem conexão');
    }
    return const [
      TopicModel(
        id: 't9',
        title: 'Recuperado com sucesso',
        mentions: 12,
        sentiment: 0.9,
      ),
    ];
  }
}

Widget _buildHarness({required TopicDataSource dataSource}) {
  return ProviderScope(
    retry: (retryCount, error) => null,
    overrides: [topicDataSourceProvider.overrideWith((ref) => dataSource)],
    child: const MaterialApp(
      locale: Locale('pt'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [Locale('pt'), Locale('en')],
      home: HomePage(),
    ),
  );
}

void main() {
  group('HomePage', () {
    testWidgets('mostra indicador de carregamento inicialmente', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildHarness(dataSource: _SuccessTopicDataSource()),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();
      await tester.pump();
    });

    testWidgets('renderiza os titulos e mencoes dos topicos', (tester) async {
      await tester.pumpWidget(
        _buildHarness(dataSource: _SuccessTopicDataSource()),
      );
      await tester.pump();
      await tester.pump();

      expect(find.text('Rotina de edição com IA'), findsOneWidget);
      expect(find.text('Shorts vs vídeos longos'), findsOneWidget);
      expect(find.text('342 menções'), findsOneWidget);
      expect(find.text('289 menções'), findsOneWidget);
      expect(find.text('Tópicos em alta'), findsOneWidget);
    });

    testWidgets('em erro mostra AppErrorView com botao de tentar novamente', (
      tester,
    ) async {
      final dataSource = _FlakyTopicDataSource();
      await tester.pumpWidget(_buildHarness(dataSource: dataSource));
      await tester.pump();
      await tester.pump();

      expect(find.byType(AppErrorView), findsOneWidget);
      expect(
        find.text('Não foi possível carregar os tópicos em alta.'),
        findsOneWidget,
      );
      expect(find.text('Tentar novamente'), findsOneWidget);
    });

    testWidgets('botao de tentar novamente refaz o carregamento', (
      tester,
    ) async {
      final dataSource = _FlakyTopicDataSource();
      await tester.pumpWidget(_buildHarness(dataSource: dataSource));
      await tester.pump();
      await tester.pump();

      expect(find.byType(AppErrorView), findsOneWidget);

      await tester.tap(find.text('Tentar novamente'));
      await tester.pump();
      await tester.pump();

      expect(find.byType(AppErrorView), findsNothing);
      expect(find.text('Recuperado com sucesso'), findsOneWidget);
      expect(dataSource.calls, 2);
    });
  });
}
