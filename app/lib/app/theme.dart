import 'package:flutter/material.dart';

/// Temas Material 3 do InfluencIA.
abstract final class AppTheme {
  /// Verde "pinho": cor semente da paleta.
  static const Color seedColor = Color(0xFF0E4D40);

  /// Verde "esmeralda": cor de acento.
  static const Color accentColor = Color(0xFF2FBF8F);

  static ThemeData get light => _buildTheme(Brightness.light);

  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    ).copyWith(secondary: accentColor);
    return ThemeData(colorScheme: colorScheme);
  }
}
