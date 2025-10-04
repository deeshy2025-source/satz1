import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';

class UnderHero extends StatelessWidget {
  const UnderHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ✅ بدل height ثابت → استخدمنا minHeight بس
      constraints: const BoxConstraints(minHeight: ConstSize.underHeroMinHeight),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ConstColors.underHeroBg,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: ConstSize.underHeroPaddingH,
        vertical: ConstSize.underHeroPaddingV,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ConstSize.underHeroMaxWidth),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth >= 900;

              // ✅ اللوجو
              final logo = Padding(
                padding: const EdgeInsets.only(right: ConstSize.underHeroPaddingH),
                child: SvgPicture.asset(
                  ConstStrings.logoLight,
                  height: ConstSize.underHeroLogoH,
                  fit: BoxFit.contain,
                  colorFilter: const ColorFilter.mode(
                      ConstColors.lightColor,
                      BlendMode.srcIn
                  ),
                ),

              );

              // ✅ النص
              final text = SelectableText(
                ConstStrings.heroHighlight,
                style: ConstText.body(context).copyWith(color: Colors.white),
                textAlign: TextAlign.justify,
              );

              // ✅ التخطيط مرن
              return isWide
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logo,
                  Expanded(child: text),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: logo,
                  ),
                  const SizedBox(height: 8),
                  text,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}