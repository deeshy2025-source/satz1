import 'package:flutter/material.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/constants/const_size.dart';

class MissionImage extends StatelessWidget {
  const MissionImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= ConstSize.missionBreakpoint;
    final imgHeight = isWide
        ? ConstSize.missionImageHeightWide
        : ConstSize.missionImageHeightNarrow;

    return ClipRRect(
      borderRadius: BorderRadius.circular(ConstSize.missionImageRadius),
      child: Image.asset(
        ConstStrings.missionImage,
        fit: BoxFit.cover,
        height: imgHeight,
      ),
    );
  }
}