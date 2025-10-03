import 'package:flutter/material.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/constants/const_size.dart';

class EdgeCenterImage extends StatelessWidget {
  const EdgeCenterImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= ConstSize.edgeBreakpoint;
    final double size =
    isWide ? ConstSize.edgeImageSizeWide : ConstSize.edgeImageSizeNarrow;

    return ClipRRect(
      borderRadius: BorderRadius.circular(ConstSize.edgeImageRadius),
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          ConstStrings.edgeCenterImage, // assets/images/space_rocket.png
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}