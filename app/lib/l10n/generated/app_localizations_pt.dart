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
  String get comingSoonTitle => 'Em breve';

  @override
  String get comingSoonMessage =>
      'Essa parte do app ainda está sendo construída.';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileAboutSection => 'Sobre';

  @override
  String get profileNicheLabel => 'Nicho';

  @override
  String get profilePlatformLabel => 'Plataforma principal';
}
