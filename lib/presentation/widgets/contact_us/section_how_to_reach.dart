import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';

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
                Text(title, style: styleBody),
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
              Text(ConstStrings.howToReachTitle, style: styleTitle),
              const SizedBox(height: 24),
              Wrap(
                spacing: 32, runSpacing: 16, alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 520,
                    child: item(Icons.phone, ConstStrings.phoneLabel),
                  ),
                  SizedBox(
                    width: 520,
                    child: item(Icons.mail, ConstStrings.emailLabel),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              Wrap(
                spacing: 32, runSpacing: 16, alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 520,
                    child: item(Icons.location_on_outlined, ConstStrings.companyLocation),
                  ),
                  SizedBox(
                    width: 520,
                    child: item(Icons.watch_later_outlined, ConstStrings.workTime),
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