import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_strings_contact_us.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_text.dart';


class QuickBadge extends StatelessWidget {
  const QuickBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: ConstColors.heroGradient,
      ),
      alignment: Alignment.center,
      child: SelectableText(
        ContactUsStrings.quickContactTitle,
        textAlign: TextAlign.center,
        style: ConstText.sectionTitle(context)
            .copyWith(color: Colors.white, fontSize: 18),
      ),
    );
  }
}