import 'package:flutter/material.dart';
import '../../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings_about_us.dart';

class EdgeTitle extends StatelessWidget {
  const EdgeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      AboutUsStrings.edgeTitle,
      style: ConstText.sectionTitle(context).copyWith(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}