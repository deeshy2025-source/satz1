import 'package:flutter/material.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_text.dart';
import '../../../../core/constants/const_strings.dart';

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
      child: Text(
        ConstStrings.quickContactTitle,
        textAlign: TextAlign.center,
        style: ConstText.sectionTitle(context)
            .copyWith(color: Colors.white, fontSize: 18),
      ),
    );
  }
}