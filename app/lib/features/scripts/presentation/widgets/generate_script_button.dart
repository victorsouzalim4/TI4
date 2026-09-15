import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/scripts/presentation/providers/script_providers.dart';

/// Botao que gera um roteiro para [topicId] e abre a tela do roteiro.
class GenerateScriptButton extends ConsumerStatefulWidget {
  const new({required this.topicId, super.key});

  final String topicId;

  @override
  ConsumerState<GenerateScriptButton> createState() =>
      _GenerateScriptButtonState();
}

class _GenerateScriptButtonState extends ConsumerState<GenerateScriptButton> {
  bool _isGenerating = false;

  Future<void> _generate() async {
    setState(() => _isGenerating = true);
    final result = await ref
        .read(scriptRepositoryProvider)
        .generateScript(widget.topicId);
    if (!mounted) return;
    setState(() => _isGenerating = false);
    result.fold(
      onOk: (script) {
        ref.invalidate(scriptsProvider);
        unawaited(
          context.pushNamed(
            AppRoutes.scriptName,
            pathParameters: {'scriptId': script.id},
          ),
        );
      },
      onErr: (failure) =>
          context.showSnackBar(context.l10n.generateScriptError),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: _isGenerating ? null : _generate,
      icon: _isGenerating
          ? const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.auto_awesome),
      label: Text(
        _isGenerating
            ? context.l10n.generateScriptLoading
            : context.l10n.generateScriptButton,
      ),
    );
  }
}
