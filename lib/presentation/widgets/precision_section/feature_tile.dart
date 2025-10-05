
import 'package:flutter/material.dart';
import 'package:satz1/core/classes/precesion_section_data.dart';
import 'package:satz1/core/constants/const_text.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';

class FeatureTile extends StatelessWidget {

  final PrecisionSectionData  feature;

   const FeatureTile({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context) {
    return Container
      (
      constraints: const BoxConstraints(minHeight: ConstSize.sectionHeight * 0.35),
      padding: const EdgeInsets.all(ConstSize.padding_16),
      decoration: BoxDecoration(
        // slightly lighter panel over the dark band
        color: ConstColors.sectionBg1.withValues(alpha:0.06),
        borderRadius: BorderRadius.circular(ConstSize.padding_16),
        border: Border.all(color: ConstColors.testBasicColor.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Container(
            width: ConstSize.padding_16 * 3.5,
            height: ConstSize.padding_16 * 3.5,
            alignment: Alignment.center,

            child: Icon(feature.icon, size: ConstSize.padding_16 * 3, color: ConstColors.testBasicColor),
          ),
          const SizedBox(width: ConstSize.padding_16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(feature.title,
                    style: ConstText.TextMid(context)
                        .copyWith(color: ConstColors.testBasicColor, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                SelectableText(feature.text,
                    style:   ConstText.body(context)
                    .copyWith(color: ConstColors.testBasicColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}