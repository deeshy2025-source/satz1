import 'package:flutter/material.dart';
import '../../../../core/constants/const_text.dart';
import '../../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings_about_us.dart';

class MissionText extends StatelessWidget {
  const MissionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(AboutUsStrings.missionTitle, style: ConstText.sectionTitle(context)),
        const SizedBox(height: ConstSize.padding_16),
        SelectableText(
          AboutUsStrings.missionBody,
          style: ConstText.body(context),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}