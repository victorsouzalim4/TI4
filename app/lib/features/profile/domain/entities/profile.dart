import 'package:flutter/foundation.dart';

/// Dados basicos do influenciador exibidos na aba de perfil.
@immutable
class Profile {
  const new({
    required this.name,
    required this.handle,
    required this.niche,
    required this.mainPlatform,
  });

  final String name;

  final String handle;

  /// Nicho de conteudo, ex.: "Tecnologia e criatividade".
  final String niche;

  /// Rede social principal, ex.: "YouTube".
  final String mainPlatform;

  String get initials {
    final parts = name.trim().split(' ');
    final first = parts.first.isEmpty ? '' : parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return '$first$last'.toUpperCase();
  }
}
