import 'package:flutter/material.dart';
import 'package:influencia/core/extensions/context_extensions.dart';

/// Titulo de secao usado nas telas de detalhe.
class SectionTitle extends StatelessWidget {
  const new(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
