import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';

class NavLogo extends StatelessWidget {
  const NavLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logoLight.png',
      height: ConstSize.logoHeight,      // من const_size.dart
      fit: BoxFit.contain,
    );
  }
}