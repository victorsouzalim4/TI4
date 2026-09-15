// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'InfluencIA';

  @override
  String get tabTrends => 'Tendências';

  @override
  String get tabScripts => 'Roteiros';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get retryButton => 'Tentar novamente';

  @override
  String environmentBadgeLabel(String environment) {
    return 'Ambiente: $environment';
  }

  @override
  String mentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menções',
      one: '$count menção',
    );
    return '$_temp0';
  }

  @override
  String get sentimentPositive => 'Positivo';

  @override
  String get sentimentNeutral => 'Neutro';

  @override
  String get sentimentNegative => 'Negativo';

  @override
  String get trendsTitle => 'Tendências';

  @override
  String get trendsSubtitle => 'Em alta na sua audiência';

  @override
  String get trendsErrorMessage =>
      'Não foi possível carregar os tópicos em alta.';

  @override
  String get analysisTitle => 'Análise';

  @override
  String get analysisErrorMessage =>
      'Não foi possível carregar a análise do tópico.';

  @override
  String get analysisSentimentSection => 'Sentimento dos comentários';

  @override
  String get analysisTermsSection => 'Termos mais citados';

  @override
  String get analysisCommentsSection => 'O que a audiência diz';

  @override
  String get generateScriptButton => 'Gerar roteiro';

  @override
  String get generateScriptLoading => 'Gerando roteiro…';

  @override
  String get generateScriptError => 'Não foi possível gerar o roteiro.';

  @override
  String get scriptsTitle => 'Roteiros';

  @override
  String get scriptsErrorMessage => 'Não foi possível carregar os roteiros.';

  @override
  String get scriptsEmptyTitle => 'Nenhum roteiro ainda';

  @override
  String get scriptsEmptyMessage =>
      'Escolha um tópico em alta e gere seu primeiro roteiro.';

  @override
  String scriptsGeneratedOn(String date) {
    return 'Gerado em $date';
  }

  @override
  String get scriptTitle => 'Roteiro';

  @override
  String get scriptErrorMessage => 'Não foi possível carregar o roteiro.';

  @override
  String get scriptHookSection => 'Gancho';

  @override
  String get scriptDevelopmentSection => 'Desenvolvimento';

  @override
  String get scriptCtaSection => 'Chamada para ação';

  @override
  String get copyButton => 'Copiar';

  @override
  String get regenerateButton => 'Regenerar';

  @override
  String get scriptCopied => 'Roteiro copiado';

  @override
  String get regenerateError => 'Não foi possível regenerar o roteiro.';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileErrorMessage => 'Não foi possível carregar o perfil.';

  @override
  String get profileCommentsAnalyzed => 'Comentários analisados';

  @override
  String get profileScriptsGenerated => 'Roteiros gerados';

  @override
  String get profilePlatformsSection => 'Plataformas conectadas';

  @override
  String get profileNotConnected => 'Não conectado';

  @override
  String get profileConnect => 'Conectar';

  @override
  String get profileConnectSoon =>
      'A conexão com as plataformas chega em breve.';

  @override
  String get profileStyleSection => 'Estilo do roteiro';

  @override
  String get profileStyleHint =>
      'Tom de voz usado pela IA ao escrever seus roteiros';
}
