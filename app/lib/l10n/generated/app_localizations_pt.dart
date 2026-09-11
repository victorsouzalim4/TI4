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
  String get homeTitle => 'Tópicos em alta';

  @override
  String homeMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menções',
      one: '$count menção',
    );
    return '$_temp0';
  }

  @override
  String get homeErrorMessage =>
      'Não foi possível carregar os tópicos em alta.';

  @override
  String get retryButton => 'Tentar novamente';

  @override
  String environmentBadgeLabel(String environment) {
    return 'Ambiente: $environment';
  }
}
