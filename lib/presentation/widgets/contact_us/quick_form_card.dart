import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_size.dart';
import '../../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_strings_contact_us.dart';
import 'app_text_field.dart';

class QuickFormCard extends StatefulWidget {
  const QuickFormCard({super.key});

  @override
  State<QuickFormCard> createState() => _QuickFormCardState();
}

class _QuickFormCardState extends State<QuickFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _first = TextEditingController();
  final _last = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _msg = TextEditingController();

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _phone.dispose();
    _msg.dispose();
    super.dispose();
  }

  void _sendEmail() {
    // تأكيد إن كل حاجة جاهزة قبل الفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final subject = Uri.encodeComponent('Quick Contact Request');
      final name = '${_first.text} ${_last.text}'.trim();

      final body = Uri.encodeComponent('''
New quick contact message from Satz website:

👤 Name: $name
📧 Email: ${_email.text}
📱 Phone: ${_phone.text}

📝 Message:
${_msg.text}

--------------------
Sent automatically from Satz contact form
''');

      final gmailUrl =
          'https://mail.google.com/mail/?view=cm&fs=1&to=${ConstStrings.companyEmail}&su=$subject&body=$body';

      web.window.open(gmailUrl, '_blank');
    });
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
              // صف أول: First / Last
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

              // صف تاني: Email / Phone
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _email,
                      hint: ContactUsStrings.formEmail,
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
                      hint: ContactUsStrings.formPhone,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: ConstSize.formFieldGap),

              // الرسالة
              AppTextField(
                controller: _msg,
                hint: ContactUsStrings.formMessage,
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
                      _sendEmail(); // ← هنا الإرسال الفعلي
                    }
                  },
                  child: SelectableText(
                    ContactUsStrings.formSubmit,
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