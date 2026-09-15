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
  String get retryButton => 'Try again';

  @override
  String environmentBadgeLabel(String environment) {
    return 'Environment: $environment';
  }

  @override
  String mentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentions',
      one: '$count mention',
    );
    return '$_temp0';
  }

  @override
  String get sentimentPositive => 'Positive';

  @override
  String get sentimentNeutral => 'Neutral';

  @override
  String get sentimentNegative => 'Negative';

  @override
  String get trendsTitle => 'Trends';

  @override
  String get trendsSubtitle => 'Trending with your audience';

  @override
  String get trendsErrorMessage => 'We could not load the trending topics.';

  @override
  String get analysisTitle => 'Analysis';

  @override
  String get analysisErrorMessage => 'We could not load the topic analysis.';

  @override
  String get analysisSentimentSection => 'Comment sentiment';

  @override
  String get analysisTermsSection => 'Most mentioned terms';

  @override
  String get analysisCommentsSection => 'What your audience says';

  @override
  String get generateScriptButton => 'Generate script';

  @override
  String get generateScriptLoading => 'Generating script…';

  @override
  String get generateScriptError => 'We could not generate the script.';

  @override
  String get scriptsTitle => 'Scripts';

  @override
  String get scriptsErrorMessage => 'We could not load the scripts.';

  @override
  String get scriptsEmptyTitle => 'No scripts yet';

  @override
  String get scriptsEmptyMessage =>
      'Pick a trending topic and generate your first script.';

  @override
  String scriptsGeneratedOn(String date) {
    return 'Generated on $date';
  }

  @override
  String get scriptTitle => 'Script';

  @override
  String get scriptErrorMessage => 'We could not load the script.';

  @override
  String get scriptHookSection => 'Hook';

  @override
  String get scriptDevelopmentSection => 'Development';

  @override
  String get scriptCtaSection => 'Call to action';

  @override
  String get copyButton => 'Copy';

  @override
  String get regenerateButton => 'Regenerate';

  @override
  String get scriptCopied => 'Script copied';

  @override
  String get regenerateError => 'We could not regenerate the script.';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileErrorMessage => 'We could not load the profile.';

  @override
  String get profileCommentsAnalyzed => 'Comments analyzed';

  @override
  String get profileScriptsGenerated => 'Scripts generated';

  @override
  String get profilePlatformsSection => 'Connected platforms';

  @override
  String get profileNotConnected => 'Not connected';

  @override
  String get profileConnect => 'Connect';

  @override
  String get profileConnectSoon => 'Platform connections are coming soon.';

  @override
  String get profileStyleSection => 'Script style';

  @override
  String get profileStyleHint =>
      'Tone of voice the AI uses when writing your scripts';
}
