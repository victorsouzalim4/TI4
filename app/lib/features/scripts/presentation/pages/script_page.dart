import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';
import 'package:influencia/features/scripts/domain/entities/script.dart';
import 'package:influencia/features/scripts/presentation/providers/script_providers.dart';
import 'package:influencia/shared/widgets/async_view.dart';
import 'package:influencia/shared/widgets/section_title.dart';

/// Tela de um roteiro: gancho, desenvolvimento e chamada para acao.
class ScriptPage extends ConsumerStatefulWidget {
  const new({required this.scriptId, super.key});

  final String scriptId;

  @override
  ConsumerState<ScriptPage> createState() => _ScriptPageState();
}

class _ScriptPageState extends ConsumerState<ScriptPage> {
  bool _isRegenerating = false;

  Future<void> _copy(Script script) async {
    await Clipboard.setData(ClipboardData(text: script.fullText));
    if (!mounted) return;
    context.showSnackBar(context.l10n.scriptCopied);
  }

  Future<void> _regenerate() async {
    setState(() => _isRegenerating = true);
    final result = await ref
        .read(scriptRepositoryProvider)
        .regenerateScript(widget.scriptId);
    if (!mounted) return;
    setState(() => _isRegenerating = false);
    result.fold(
      onOk: (_) {
        ref
          ..invalidate(scriptProvider(widget.scriptId))
          ..invalidate(scriptsProvider);
      },
      onErr: (failure) => context.showSnackBar(context.l10n.regenerateError),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scriptAsync = ref.watch(scriptProvider(widget.scriptId));
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.scriptTitle)),
      body: AsyncView(
        value: scriptAsync,
        errorMessage: context.l10n.scriptErrorMessage,
        onRetry: () => ref.invalidate(scriptProvider(widget.scriptId)),
        builder: (script) => Column(
          children: [
            Expanded(child: _ScriptBody(script: script)),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _copy(script),
                        icon: const Icon(Icons.copy_rounded),
                        label: Text(context.l10n.copyButton),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _isRegenerating ? null : _regenerate,
                        icon: _isRegenerating
                            ? const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.refresh_rounded),
                        label: Text(context.l10n.regenerateButton),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScriptBody extends StatelessWidget {
  const new({required this.script});

  final Script script;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      children: [
        Text(
          script.topicTitle,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        SectionTitle(l10n.scriptHookSection),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(AppTheme.radius),
          ),
          child: Text(
            '“${script.hook}”',
            style: context.textTheme.titleMedium?.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 24),
        SectionTitle(l10n.scriptDevelopmentSection),
        const SizedBox(height: 12),
        Text(
          script.development,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        SectionTitle(l10n.scriptCtaSection),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              script.callToAction,
              style: context.textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
