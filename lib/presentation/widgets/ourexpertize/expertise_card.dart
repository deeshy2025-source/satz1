
import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_text.dart';

import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';
class ExpertiseCard extends StatelessWidget {
  final String title;
  final List<String> points;

  const ExpertiseCard({required this.title, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 400), // 👈 خلي البطاقة أطول
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(title,
              style: ConstText.TextMid(context)),
          const SizedBox(height: 12),
          for (final p in points)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SelectableText("• "),
                  Expanded(child: SelectableText(p,style: ConstText.body(context),)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}