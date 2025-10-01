import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_strings.dart';

class FooterBottomBar extends StatelessWidget {
  const FooterBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: ConstColors.footerText,
      fontSize: 14,
    );

    return Center(
      child: Text(
        ConstStrings.footerCopyright,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}