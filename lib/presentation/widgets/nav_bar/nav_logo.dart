import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_strings.dart';
import '../../../core/constants/const_size.dart';

class NavLogo extends StatelessWidget {
  const NavLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ConstStrings.logoLight,
      height: ConstSize.logoHeight,      // من const_size.dart
      fit: BoxFit.contain,
    );
  }
}