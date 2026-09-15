import 'package:flutter/foundation.dart';

/// Plataformas sociais que o InfluencIA consegue conectar.
enum SocialPlatform { youtube, instagram, tiktok }

/// Perfil do influenciador e o estado das conexoes com as plataformas.
@immutable
class Profile {
  const new({
    required this.name,
    required this.handle,
    required this.niche,
    required this.scriptTone,
    required this.commentsAnalyzed,
    required this.scriptsGenerated,
    required this.platforms,
  });

  final String name;

  final String handle;

  /// Nicho de conteudo, ex.: "Tecnologia e criatividade".
  final String niche;

  /// Tom de voz usado na geracao de roteiros.
  final String scriptTone;

  final int commentsAnalyzed;

  final int scriptsGenerated;

  final List<PlatformConnection> platforms;

  String get initials {
    final parts = name.trim().split(' ');
    final first = parts.first.isEmpty ? '' : parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return '$first$last'.toUpperCase();
  }
}

/// Estado da conexao com uma plataforma.
@immutable
class PlatformConnection {
  const new({required this.platform, required this.isConnected, this.handle});

  final SocialPlatform platform;

  final bool isConnected;

  /// Usuario na plataforma, quando conectada.
  final String? handle;
}
