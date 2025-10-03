import 'package:flutter/material.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_size.dart';
import '../../../../core/constants/const_text.dart';
import '../../../../core/constants/const_strings.dart';
import 'app_text_field.dart';

class QuickFormCard extends StatefulWidget {
  const QuickFormCard({super.key});

  @override
  State<QuickFormCard> createState() => _QuickFormCardState();
}

class _QuickFormCardState extends State<QuickFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _first = TextEditingController();
  final _last  = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _msg   = TextEditingController();

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _phone.dispose();
    _msg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Theme محلي اختياري لتحسين ألوان المؤشر/التحديد
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
              // صف أول: First / Last
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _first,
                      hint: ConstStrings.formFirstName,
                      validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: ConstSize.formFieldGap),
                  Expanded(
                    child: AppTextField(
                      controller: _last,
                      hint: ConstStrings.formLastName,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: ConstSize.formFieldGap),

              // صف تاني: Email / Phone
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _email,
                      hint: ConstStrings.formEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Required';
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
                      hint: ConstStrings.formPhone,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: ConstSize.formFieldGap),

              // رسالة
              AppTextField(
                controller: _msg,
                hint: ConstStrings.formMessage,
                maxLines: 6,
              ),

              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstColors.mid,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: SelectableText('Submitted ✓')),
                      );
                    }
                  },
                  child: SelectableText(
                    ConstStrings.formSubmit,
                    style: ConstText.navButtonText(context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}