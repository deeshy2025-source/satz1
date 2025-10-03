import 'package:flutter/material.dart';
import '../../../../core/constants/const_size.dart';
import '../../../../core/constants/const_strings.dart';

class AboutCapsuleImage extends StatelessWidget {
  const AboutCapsuleImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final bool isWide = screenW >= ConstSize.aboutBreakpoint;
    final double imgH =
    isWide ? ConstSize.aboutImageHWide : ConstSize.aboutImageHNarrow;

    // نستخدم Transform عشان نعمل overlap بسيط للصورة على الكارد اليسار (زي التصميم)
    return Transform.translate(
      offset: Offset(isWide ? ConstSize.aboutImageOverlapX : 0, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ConstSize.aboutImageRadius),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            ConstStrings.aboutUsImage,
            fit: BoxFit.cover,
            height: imgH, // بيساعد الـ layout في حساب الارتفاع
          ),
        ),
      ),
    );
  }
}