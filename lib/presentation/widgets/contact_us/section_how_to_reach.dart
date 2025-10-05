import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings_contact_us.dart';
import '../../../core/constants/const_text.dart';

class SectionHowToReach extends StatelessWidget {
  const SectionHowToReach({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTitle = ConstText.sectionTitle(context);
    final styleBody  = ConstText.body(context);

    Widget item(IconData icon, String title) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(title, style: styleBody),
              ],
            ),
          ),
        ],
      );
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: ConstSize.padding_16, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ContactUsStrings.howToReachTitle, style: styleTitle),
              const SizedBox(height: 24),
              Wrap(
                spacing: 32, runSpacing: 16, alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 520,
                    child: item(Icons.phone, ContactUsStrings.phoneLabel),
                  ),
                  SizedBox(
                    width: 520,
                    child: item(Icons.mail, ContactUsStrings.emailLabel),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              Wrap(
                spacing: 32, runSpacing: 16, alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 520,
                    child: item(Icons.location_on_outlined, ContactUsStrings.companyLocation),
                  ),
                  SizedBox(
                    width: 520,
                    child: item(Icons.watch_later_outlined, ContactUsStrings.workTime),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}