import 'package:flutter/material.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/l10n/generated/app_localizations.dart';

/// Widget raiz do InfluencIA.
class App extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [Locale('pt'), Locale('en')],
      routerConfig: appRouter,
    );
  }
}
