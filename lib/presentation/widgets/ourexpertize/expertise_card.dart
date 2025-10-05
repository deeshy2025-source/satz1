
import 'package:flutter/material.dart';
import 'package:satz1/core/classes/expertise_data.dart';
import 'package:satz1/core/constants/const_text.dart';

class ExpertiseCard extends StatelessWidget {

  final ExpertiseData expertiseCard;


  const ExpertiseCard({super.key, required this.expertiseCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 400),
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
          SelectableText(expertiseCard.title,
              style: ConstText.TextMid(context)),
          const SizedBox(height: 12),
          for (final p in expertiseCard.points)
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