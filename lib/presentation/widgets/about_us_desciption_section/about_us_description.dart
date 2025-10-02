import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import 'about_text_card.dart';
import 'about_us_image.dart';

class SectionAboutUs extends StatelessWidget {
  const SectionAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: ConstColors.heroGradient),
      padding: const EdgeInsets.symmetric(
        horizontal: ConstSize.aboutPaddingH,
        vertical: ConstSize.aboutPaddingV,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ConstSize.aboutContentMaxW),
          child: LayoutBuilder(
            builder: (context, c) {
              final bool isWide = c.maxWidth >= ConstSize.aboutBreakpoint;

              if (isWide) {
                // صف: نسب 5/12 للنص + 7/12 للصورة مع overlap خفيف
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(flex: ConstSize.aboutFlexText, child: AboutTextCard()),
                    SizedBox(width: ConstSize.aboutGutter),
                    Expanded(
                      flex: ConstSize.aboutFlexImage,
                      child: AboutCapsuleImage(),
                    ),
                  ],
                );
              }

              // شاشة ضيقة: عمودي (الصورة فوق ثم النص)
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AboutCapsuleImage(),
                  SizedBox(height: ConstSize.aboutGutter),
                  AboutTextCard(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}