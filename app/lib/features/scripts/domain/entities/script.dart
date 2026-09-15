import 'package:flutter/foundation.dart';

/// Roteiro gerado a partir de um topico em alta.
@immutable
class Script {
  const new({
    required this.id,
    required this.topicId,
    required this.topicTitle,
    required this.hook,
    required this.development,
    required this.callToAction,
    required this.createdAt,
  });

  final String id;

  final String topicId;

  final String topicTitle;

  /// Abertura curta que prende a atencao nos primeiros segundos.
  final String hook;

  /// Corpo do roteiro; paragrafos separados por linha em branco.
  final String development;

  final String callToAction;

  final DateTime createdAt;

  /// Texto completo, pronto para copiar.
  String get fullText => '$hook\n\n$development\n\n$callToAction';
}
