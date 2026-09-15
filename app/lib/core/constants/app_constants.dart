/// Constantes globais do aplicativo.
abstract final class AppConstants {
  static const String appName = 'InfluencIA';

  static const Duration connectTimeout = Duration(seconds: 15);

  static const Duration receiveTimeout = Duration(seconds: 15);

  static const Duration sendTimeout = Duration(seconds: 15);

  /// Atraso das leituras mockadas, para simular a rede.
  static const Duration mockDataSourceDelay = Duration(milliseconds: 300);

  /// Atraso da geracao de roteiro mockada, para simular a IA trabalhando.
  static const Duration mockGenerationDelay = Duration(milliseconds: 1200);
}
