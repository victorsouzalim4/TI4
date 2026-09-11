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
  String get homeTitle => 'Trending topics';

  @override
  String homeMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentions',
      one: '$count mention',
    );
    return '$_temp0';
  }

  @override
  String get homeErrorMessage => 'We could not load the trending topics.';

  @override
  String get retryButton => 'Try again';

  @override
  String environmentBadgeLabel(String environment) {
    return 'Environment: $environment';
  }
}
