import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_size.dart';
import '../../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings_contact_us.dart';
import 'app_text_field.dart';

class QuickFormCard extends StatefulWidget {
  const QuickFormCard({super.key});

  @override
  State<QuickFormCard> createState() => _QuickFormCardState();
}

class _QuickFormCardState extends State<QuickFormCard> {
  static const String _functionUrl =
      'https://us-central1-staz-v1.cloudfunctions.net/contactSendEmails';

  final _formKey = GlobalKey<FormState>();
  final _first = TextEditingController();
  final _last = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _msg = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _phone.dispose();
    _msg.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    try {
      final res = await http.post(
        Uri.parse(_functionUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': _first.text.trim(),
          'lastName': _last.text.trim(),
          'email': _email.text.trim(),
          'phone': _phone.text.trim(),
          'message': _msg.text.trim(),
        }),
      );

      if (res.statusCode < 200 || res.statusCode >= 300) {
        throw Exception(res.body);
      }

      // clear fields
      _first.clear();
      _last.clear();
      _email.clear();
      _phone.clear();
      _msg.clear();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully ✅')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localTheme = Theme.of(context).copyWith(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.white24,
        selectionHandleColor: Colors.white,
      ),
    );

    return Theme(
      data: localTheme,
      child: Container(
        padding: const EdgeInsets.all(ConstSize.formCardPad),
        decoration: BoxDecoration(
          gradient: ConstColors.heroGradient,
          borderRadius: BorderRadius.circular(ConstSize.formCardRadius),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // First / Last
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _first,
                      hint: ContactUsStrings.formFirstName,
                      validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: ConstSize.formFieldGap),
                  Expanded(
                    child: AppTextField(
                      controller: _last,
                      hint: ContactUsStrings.formLastName,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: ConstSize.formFieldGap),

              // Email / Phone
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _email,
                      hint: ContactUsStrings.formEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Required';
                        final ok =
                        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim());
                        return ok ? null : 'Invalid email';
                      },
                    ),
                  ),
                  const SizedBox(width: ConstSize.formFieldGap),
                  Expanded(
                    child: AppTextField(
                      controller: _phone,
                      hint: ContactUsStrings.formPhone,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: ConstSize.formFieldGap),

              // Message
              AppTextField(
                controller: _msg,
                hint: ContactUsStrings.formMessage,
                maxLines: 6,
                validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),

              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstColors.mid,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : Text(
                    ContactUsStrings.formSubmit,
                    style: ConstText.navButtonText(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
