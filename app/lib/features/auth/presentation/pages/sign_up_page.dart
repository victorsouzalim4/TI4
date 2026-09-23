import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:influencia/app/router.dart';
import 'package:influencia/app/theme.dart';
import 'package:influencia/core/extensions/context_extensions.dart';

/// Tela de cadastro: formulario simples, sem backend por enquanto.
class SignUpPage extends StatefulWidget {
  const new({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  static const int _minPasswordLength = 6;

  static final RegExp _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // O backend Vortex ainda nao existe: o cadastro so confirma e entra.
    context
      ..showSnackBar(context.l10n.signUpSuccess)
      ..goNamed(AppRoutes.trendsName);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.signUpTitle)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Text(
              l10n.signUpSubtitle,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(labelText: l10n.signUpNameLabel),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              validator: (value) =>
                  (value ?? '').trim().isEmpty ? l10n.signUpNameRequired : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: l10n.signUpEmailLabel),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) => _emailPattern.hasMatch((value ?? '').trim())
                  ? null
                  : l10n.signUpEmailInvalid,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: l10n.signUpPasswordLabel),
              obscureText: true,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: (value) => (value ?? '').length < _minPasswordLength
                  ? l10n.signUpPasswordTooShort(_minPasswordLength)
                  : null,
            ),
            const SizedBox(height: 32),
            FilledButton(onPressed: _submit, child: Text(l10n.signUpSubmit)),
          ],
        ),
      ),
    );
  }
}
