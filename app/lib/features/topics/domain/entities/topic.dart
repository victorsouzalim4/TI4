import 'package:flutter/foundation.dart';
import 'package:influencia/features/topics/domain/entities/sentiment.dart';

/// Topico em alta identificado nos comentarios da audiencia.
@immutable
class Topic {
  const new({
    required this.id,
    required this.title,
    required this.mentions,
    required this.sentiment,
  });

  final String id;

  final String title;

  /// Quantidade de mencoes nos comentarios analisados.
  final int mentions;

  /// Sentimento medio da audiencia, de 0 (negativo) a 1 (positivo).
  final double sentiment;

  Sentiment get sentimentLabel => Sentiment.fromScore(sentiment);

  @override
  bool operator ==(Object other) {
    return other is Topic &&
        other.id == id &&
        other.title == title &&
        other.mentions == mentions &&
        other.sentiment == sentiment;
  }

  @override
  int get hashCode => Object.hash(id, title, mentions, sentiment);
}
