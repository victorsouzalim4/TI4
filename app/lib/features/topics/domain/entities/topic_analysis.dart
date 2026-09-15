import 'package:flutter/foundation.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';
import 'package:influencia/features/topics/domain/entities/topic.dart';

/// Analise detalhada de um topico: distribuicao de sentimento, termos mais
/// citados e comentarios representativos.
@immutable
class TopicAnalysis {
  const new({
    required this.topic,
    required this.positiveShare,
    required this.neutralShare,
    required this.negativeShare,
    required this.terms,
    required this.comments,
  });

  final Topic topic;

  /// Fracoes (0 a 1) dos comentarios por sentimento; somam 1.
  final double positiveShare;
  final double neutralShare;
  final double negativeShare;

  final List<TopicTerm> terms;

  final List<AudienceComment> comments;
}

/// Termo recorrente nos comentarios de um topico.
@immutable
class TopicTerm {
  const new({required this.term, required this.count});

  final String term;

  final int count;
}

/// Comentario representativo da audiencia.
@immutable
class AudienceComment {
  const new({
    required this.author,
    required this.text,
    required this.sentiment,
  });

  final String author;

  final String text;

  final Sentiment sentiment;
}
