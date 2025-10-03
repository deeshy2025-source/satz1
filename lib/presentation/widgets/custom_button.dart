import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final Color color;
  final double hPadding;
  final double vPadding;
  final double radius;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color = ConstColors.primary, // افتراضي: الأزرق بتاع Contact
    this.hPadding = ConstSize.buttonHPadding,
    this.vPadding = ConstSize.buttonVPadding,
    this.radius = ConstSize.buttonRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: ConstColors.colorWhite,
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 0,
      ),
      onPressed: onTap,
      child: Text(title, style: ConstText.navButtonText(context)),
    );
  }
}