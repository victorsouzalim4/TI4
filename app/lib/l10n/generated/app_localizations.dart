import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// Nome do aplicativo, usado como titulo da janela/aba.
  ///
  /// In pt, this message translates to:
  /// **'InfluencIA'**
  String get appTitle;

  /// Rotulo da aba de topicos em alta na bottom bar.
  ///
  /// In pt, this message translates to:
  /// **'Tendências'**
  String get tabTrends;

  /// Rotulo da aba de roteiros na bottom bar.
  ///
  /// In pt, this message translates to:
  /// **'Roteiros'**
  String get tabScripts;

  /// Rotulo da aba de perfil na bottom bar.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get tabProfile;

  /// Rotulo do botao que refaz o carregamento apos um erro.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get retryButton;

  /// Rotulo de acessibilidade do selo de ambiente no AppBar.
  ///
  /// In pt, this message translates to:
  /// **'Ambiente: {environment}'**
  String environmentBadgeLabel(String environment);

  /// Quantidade de mencoes de um topico nos comentarios.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, one{{count} menção} other{{count} menções}}'**
  String mentions(int count);

  /// Rotulo do sentimento positivo.
  ///
  /// In pt, this message translates to:
  /// **'Positivo'**
  String get sentimentPositive;

  /// Rotulo do sentimento neutro.
  ///
  /// In pt, this message translates to:
  /// **'Neutro'**
  String get sentimentNeutral;

  /// Rotulo do sentimento negativo.
  ///
  /// In pt, this message translates to:
  /// **'Negativo'**
  String get sentimentNegative;

  /// Titulo da aba com o ranking de topicos da audiencia.
  ///
  /// In pt, this message translates to:
  /// **'Tendências'**
  String get trendsTitle;

  /// Frase de apoio acima do ranking de topicos.
  ///
  /// In pt, this message translates to:
  /// **'Em alta na sua audiência'**
  String get trendsSubtitle;

  /// Mensagem exibida quando o carregamento dos topicos falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os tópicos em alta.'**
  String get trendsErrorMessage;

  /// Titulo do AppBar da tela de analise de um topico.
  ///
  /// In pt, this message translates to:
  /// **'Análise'**
  String get analysisTitle;

  /// Mensagem exibida quando o carregamento da analise falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar a análise do tópico.'**
  String get analysisErrorMessage;

  /// Titulo da secao com a distribuicao de sentimento.
  ///
  /// In pt, this message translates to:
  /// **'Sentimento dos comentários'**
  String get analysisSentimentSection;

  /// Titulo da secao com os termos recorrentes.
  ///
  /// In pt, this message translates to:
  /// **'Termos mais citados'**
  String get analysisTermsSection;

  /// Titulo da secao com comentarios representativos.
  ///
  /// In pt, this message translates to:
  /// **'O que a audiência diz'**
  String get analysisCommentsSection;

  /// Rotulo do botao que gera um roteiro para o topico.
  ///
  /// In pt, this message translates to:
  /// **'Gerar roteiro'**
  String get generateScriptButton;

  /// Rotulo do botao enquanto o roteiro esta sendo gerado.
  ///
  /// In pt, this message translates to:
  /// **'Gerando roteiro…'**
  String get generateScriptLoading;

  /// Mensagem exibida quando a geracao do roteiro falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível gerar o roteiro.'**
  String get generateScriptError;

  /// Titulo da aba com a lista de roteiros gerados.
  ///
  /// In pt, this message translates to:
  /// **'Roteiros'**
  String get scriptsTitle;

  /// Mensagem exibida quando o carregamento dos roteiros falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os roteiros.'**
  String get scriptsErrorMessage;

  /// Titulo do estado vazio da lista de roteiros.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum roteiro ainda'**
  String get scriptsEmptyTitle;

  /// Orientacao do estado vazio da lista de roteiros.
  ///
  /// In pt, this message translates to:
  /// **'Escolha um tópico em alta e gere seu primeiro roteiro.'**
  String get scriptsEmptyMessage;

  /// Data de geracao de um roteiro na lista.
  ///
  /// In pt, this message translates to:
  /// **'Gerado em {date}'**
  String scriptsGeneratedOn(String date);

  /// Titulo do AppBar da tela de um roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Roteiro'**
  String get scriptTitle;

  /// Mensagem exibida quando o carregamento do roteiro falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar o roteiro.'**
  String get scriptErrorMessage;

  /// Titulo da secao com a abertura do roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Gancho'**
  String get scriptHookSection;

  /// Titulo da secao com o corpo do roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvimento'**
  String get scriptDevelopmentSection;

  /// Titulo da secao com o fechamento do roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Chamada para ação'**
  String get scriptCtaSection;

  /// Rotulo do botao que copia o roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Copiar'**
  String get copyButton;

  /// Rotulo do botao que gera uma nova versao do roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Regenerar'**
  String get regenerateButton;

  /// Confirmacao exibida apos copiar o roteiro.
  ///
  /// In pt, this message translates to:
  /// **'Roteiro copiado'**
  String get scriptCopied;

  /// Mensagem exibida quando a regeneracao falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível regenerar o roteiro.'**
  String get regenerateError;

  /// Titulo da aba de perfil.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profileTitle;

  /// Mensagem exibida quando o carregamento do perfil falha.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar o perfil.'**
  String get profileErrorMessage;

  /// Rotulo da estatistica de comentarios analisados.
  ///
  /// In pt, this message translates to:
  /// **'Comentários analisados'**
  String get profileCommentsAnalyzed;

  /// Rotulo da estatistica de roteiros gerados.
  ///
  /// In pt, this message translates to:
  /// **'Roteiros gerados'**
  String get profileScriptsGenerated;

  /// Titulo da secao com as redes sociais.
  ///
  /// In pt, this message translates to:
  /// **'Plataformas conectadas'**
  String get profilePlatformsSection;

  /// Estado de uma plataforma ainda nao conectada.
  ///
  /// In pt, this message translates to:
  /// **'Não conectado'**
  String get profileNotConnected;

  /// Rotulo do botao que inicia a conexao com uma plataforma.
  ///
  /// In pt, this message translates to:
  /// **'Conectar'**
  String get profileConnect;

  /// Aviso exibido ao tentar conectar uma plataforma (mock).
  ///
  /// In pt, this message translates to:
  /// **'A conexão com as plataformas chega em breve.'**
  String get profileConnectSoon;

  /// Titulo da secao com o tom de voz dos roteiros.
  ///
  /// In pt, this message translates to:
  /// **'Estilo do roteiro'**
  String get profileStyleSection;

  /// Explicacao do campo de tom de voz.
  ///
  /// In pt, this message translates to:
  /// **'Tom de voz usado pela IA ao escrever seus roteiros'**
  String get profileStyleHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
