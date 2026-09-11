/// Configuracao do aplicativo lida de `--dart-define` em tempo de build.
abstract final class AppConfig {
  static const String appEnv = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'dev',
  );

  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8080',
  );

  static bool get isDev => appEnv == 'dev';

  static bool get isStaging => appEnv == 'staging';

  static bool get isProd => appEnv == 'prod';
}
