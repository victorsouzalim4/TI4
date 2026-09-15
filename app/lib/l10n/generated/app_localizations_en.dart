// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'InfluencIA';

  @override
  String get tabTrends => 'Trends';

  @override
  String get tabScripts => 'Scripts';

  @override
  String get tabProfile => 'Profile';

  @override
  String get comingSoonTitle => 'Coming soon';

  @override
  String get comingSoonMessage => 'This part of the app is still being built.';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileAboutSection => 'About';

  @override
  String get profileNicheLabel => 'Niche';

  @override
  String get profilePlatformLabel => 'Main platform';
}
