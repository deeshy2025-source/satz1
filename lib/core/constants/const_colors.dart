import 'package:flutter/material.dart';

class ConstColors {

  static const Color primary = Color(0xFF211146);
  static const Color secondary = Color(0xFF1D0D3D);
  static const Color accent = Color(0xFF4C258D);
  static const Color mid = Color(0xFF3F006C);
  static const Color colorWhite = Colors.white;
  static const Color testBasicColor = Colors.white;
  static const Color lightColor = Color(0xFFE4D5FF);


  static const Color underHeroBg = Color(0xFF151128);

  static const Color lightMidColor =  Color(0xFFE6D5FF);
  static const Color veryLightColor =  Color(0xFFDAD0FF);


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
  static const LinearGradient expertiseGradient =LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
  Color(0xFFF2E9FF),
  Color(0xFFE6D5FF),
  Color(0xFFDAD0FF),
  ],
  );

}
