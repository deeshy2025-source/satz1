
import 'package:flutter/material.dart';

import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';

class TextSide extends StatelessWidget {
  const TextSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
         Text(ConstStrings.appName, style: ConstText.headline(context)),
        const SizedBox(height: 16),
        Text(ConstStrings.heroSub1, style: ConstText.subHeadline(context),textAlign: TextAlign.justify,),
        const SizedBox(height: 8),
        Text(ConstStrings.heroSub2, style: ConstText.subHeadline(context)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: ConstColors.mid,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(ConstStrings.heroHighText,
              style: ConstText.highlight(context)),
        ),
      ],
    );
  }
}