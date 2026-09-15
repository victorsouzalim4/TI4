import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/l10n/generated/app_localizations.dart';

/// Monta a tela dentro de um MaterialApp localizado (pt) com os overrides de
/// providers informados.
extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget home, {
    List<Override> overrides = const [],
  }) async {
    await pumpWidget(
      ProviderScope(
        retry: (retryCount, error) => null,
        overrides: overrides,
        child: MaterialApp(
          locale: const Locale('pt'),
          theme: AppTheme.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('pt'), Locale('en')],
          home: home,
        ),
      ),
    );
  }

  /// Avanca dois frames: o do provider resolvendo e o da nova arvore.
  Future<void> settleProviders() async {
    await pump();
    await pump();
  }
}
