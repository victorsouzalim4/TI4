import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/features/home/data/models/topic_model.dart';
import 'package:influencia/features/home/domain/entities/topic.dart';

void main() {
  const model = TopicModel(
    id: 't1',
    title: 'Rotina de edição com IA',
    mentions: 342,
    sentiment: 0.86,
  );

  final json = <String, dynamic>{
    'id': 't1',
    'title': 'Rotina de edição com IA',
    'mentions': 342,
    'sentiment': 0.86,
  };

  group('TopicModel', () {
    test('fromJson cria o modelo corretamente', () {
      expect(TopicModel.fromJson(json), model);
    });

    test('toJson serializa o modelo corretamente', () {
      expect(model.toJson(), json);
    });

    test('round-trip fromJson/toJson preserva o modelo', () {
      expect(TopicModel.fromJson(model.toJson()), model);
    });

    test('fromJson aceita sentiment como int do JSON', () {
      final jsonWithIntSentiment = <String, dynamic>{
        'id': 't2',
        'title': 'Setup barato para gravar em casa',
        'mentions': 10,
        'sentiment': 1,
      };
      final parsed = TopicModel.fromJson(jsonWithIntSentiment);
      expect(parsed.sentiment, 1.0);
    });

    test('toEntity converte para Topic com os mesmos campos', () {
      expect(
        model.toEntity(),
        const Topic(
          id: 't1',
          title: 'Rotina de edição com IA',
          mentions: 342,
          sentiment: 0.86,
        ),
      );
    });
  });
}
