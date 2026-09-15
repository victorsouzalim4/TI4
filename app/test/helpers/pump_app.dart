import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/l10n/generated/app_localizations.dart';

/// Monta a tela dentro de um MaterialApp localizado (pt).
extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget home) async {
    await pumpWidget(
      MaterialApp(
        locale: const Locale('pt'),
        theme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('pt'), Locale('en')],
        home: home,
      ),
    );
  }
}
