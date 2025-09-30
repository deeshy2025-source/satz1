import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';

import '../../../core/constants/const_size.dart';

import 'text_side.dart';
import 'capsule_video.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1000;
    final double heroHeight =
    isWide ? ConstSize.heroHeightWide : ConstSize.heroHeightNarrow;

    return Container(
      height: heroHeight,
      width: double.infinity,
      decoration: const BoxDecoration(gradient: ConstColors.heroGradient),
      padding: const EdgeInsets.symmetric(
        horizontal: ConstSize.padding_24,
        vertical: ConstSize.padding_24,
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final content = [
            const Expanded(flex: 5, child: TextSide()),
            const SizedBox(width: ConstSize.padding_24, height: ConstSize.padding_24),
            Expanded(
              flex: 6,
              child: CapsuleVideo(
                assetPath: 'assets/videos/satVideo2.mp4',
                height: heroHeight,
              ),
            ),
          ];

          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: c.maxWidth >= 1000
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: content,
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: content.reversed.toList(),
            ),
          );
        },
      ),
    );
  }
}