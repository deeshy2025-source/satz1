import 'package:flutter/material.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/constants/const_size.dart';

class ValuesImage extends StatelessWidget {
  const ValuesImage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide =
        MediaQuery.of(context).size.width >= ConstSize.valuesBreakpoint;
    final double h =
    isWide ? ConstSize.valuesImageHWide : ConstSize.valuesImageHNarrow;

    return ClipRRect(
      borderRadius: BorderRadius.circular(ConstSize.valuesImageRadius),
      child: SizedBox(
        height: h,
        width: h, // ✅ علشان تبقى مربعة
        child: Image.asset(
          ConstStrings.valuesImage,  // our_Values.png
          fit: BoxFit.contain,       // ✅ بدل cover
        ),
      ),
    );
  }
}