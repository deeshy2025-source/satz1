import 'package:flutter/material.dart';
import 'const_colors.dart';

class ConstText {
  // 🔧 دالة مساعدة: بتعمل clamp للخط بين حد أدنى وأقصى حسب عرض الشاشة
  static double _scaleForWidth(BuildContext context, {
    required double min,
    required double max,
  }) {
    final width = MediaQuery.of(context).size.width;
    const minW = 360.0;   // موبايل صغير
    const maxW = 1440.0;  // شاشة ديسكتوب كبيرة
    final t = ((width - minW) / (maxW - minW)).clamp(0.0, 1.0);
    return min + (max - min) * t;
  }

  // ======= Styles =======

  static TextStyle headline(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: _scaleForWidth(context, min: 24, max: 40),
    fontWeight: FontWeight.bold,
    height: 1.1,
  );

  static TextStyle subHeadline(BuildContext context) => TextStyle(
    color: Colors.white70,
    fontSize: _scaleForWidth(context, min: 14, max: 20),
    height: 1.3,
  );

  static TextStyle highlight(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: _scaleForWidth(context, min: 13, max: 18),
    height: 1.35,
  );

  static TextStyle navLinkStyle(BuildContext context) => TextStyle(
    fontSize: _scaleForWidth(context, min: 14, max: 18),
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static TextStyle navButtonText(BuildContext context) => TextStyle(
    fontSize: _scaleForWidth(context, min: 14, max: 18),
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle sectionTitle(BuildContext context) => TextStyle(
    fontSize: _scaleForWidth(context, min: 22, max: 36),
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );

  static TextStyle heroHeadline(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: _scaleForWidth(context, min: 28, max: 100),
    fontWeight: FontWeight.bold,
    height: 1.1,
  );

  static TextStyle heroSub(BuildContext context) => TextStyle(
    color: Colors.white70,
    fontSize: _scaleForWidth(context, min: 14, max: 50),
    height: 1.3,
  );

  static TextStyle heroHighlight(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: _scaleForWidth(context, min: 14, max: 17),
    height: 1.35,
  );

  static TextStyle body(BuildContext context) => TextStyle(
    fontSize: _scaleForWidth(context, min: 14, max: 18),
    color: Colors.black87,
    height: 1.5,
  );

  static TextStyle smallLink(BuildContext context) => TextStyle(
    fontSize: _scaleForWidth(context, min: 12, max: 14),
    color: ConstColors.primary,
    fontWeight: FontWeight.w600,
  );
}