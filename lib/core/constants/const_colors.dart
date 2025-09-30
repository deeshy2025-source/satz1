import 'package:flutter/material.dart';

class ConstColors {

  static const Color primary = Color(0xFF1F1746);
  static const Color secondary = Color(0xFF0E0929);
  static const Color accent = Color(0xFF3E2E8C);

  static const Color scaffoldBg = Color(0xFFF8F9FB);
  static const Color sectionBg1 = Color(0xFFFFECB3);
  static const Color sectionBg2 = Color(0xFFC8E6C9);
  static const Color sectionBg3 = Color(0xFFBBDEFB);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [accent,primary, secondary],
    stops: [0.0,0.3,1.0],
  );


}
