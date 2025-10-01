import 'package:flutter/material.dart';

import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_text.dart';


class UnderHero extends StatelessWidget {
  const UnderHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstSize.underHeroHeight,
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
          constraints: const BoxConstraints(
            maxWidth: ConstSize.underHeroMaxWidth,
          ),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth >= 900;

              final content = [
                Padding(
                  padding: const EdgeInsets.only(right: ConstSize.underHeroPaddingH),
                  child: Image.asset(
                    'assets/images/LogoDark.png',
                    height: ConstSize.underHeroLogoH, // ✅ من const
                    fit: BoxFit.contain,
                    semanticLabel: 'SATZ Tech Logo',
                  ),
                ),
                Expanded(
                  child: Text(
                    ConstStrings.heroHighlight,
                    style: ConstText.body(context).copyWith(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ];

              return isWide
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: content,
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: ConstSize.underHeroPaddingV),
                      child: Image.asset(
                        'assets/images/LogoDark.png',
                        height: ConstSize.underHeroLogoH, // ✅ من const
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    ConstStrings.heroHighlight,
                    style: ConstText.body(context).copyWith(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}