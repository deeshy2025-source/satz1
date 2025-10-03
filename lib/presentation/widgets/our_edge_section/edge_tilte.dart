import 'package:flutter/material.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/constants/const_text.dart';

class EdgeTitle extends StatelessWidget {
  const EdgeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ConstStrings.edgeTitle,
      style: ConstText.sectionTitle(context).copyWith(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}