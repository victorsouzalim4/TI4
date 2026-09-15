/// Classificacao de sentimento de um comentario ou de um topico.
enum Sentiment {
  positive,
  neutral,
  negative;

  /// Converte um score medio (0 = negativo, 1 = positivo) em [Sentiment].
  static Sentiment fromScore(double score) {
    if (score >= 0.66) return Sentiment.positive;
    if (score >= 0.33) return Sentiment.neutral;
    return Sentiment.negative;
  }
}
