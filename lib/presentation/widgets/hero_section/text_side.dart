
import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_strings_home_page.dart';

import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';

class TextSide extends StatelessWidget {
  const TextSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
         SelectableText(ConstStrings.appName, style: ConstText.headline(context)),
        const SizedBox(height: 16),
        SelectableText(ConstHomePage.heroSub1, style: ConstText.subHeadline(context),textAlign: TextAlign.justify,),
        const SizedBox(height: 8),
        SelectableText(ConstHomePage.heroSub2, style: ConstText.subHeadline(context)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: ConstColors.mid,
            borderRadius: BorderRadius.circular(14),
          ),
          child: SelectableText(ConstHomePage.heroHighText,
              style: ConstText.highlight(context)),
        ),
      ],
    );
  }
}