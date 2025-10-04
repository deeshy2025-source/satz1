import 'package:flutter/material.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/constants/const_text.dart';
import '../../../../core/constants/const_size.dart';

class ValuesList extends StatelessWidget {
  const ValuesList({super.key});

  Widget _valueItem(BuildContext context, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان بولد
          SelectableText(
            title,
            style: ConstText.sectionTitle(context).copyWith(fontSize: 22),
          ),
          const SizedBox(height: 8),
          // الوصف
          SelectableText(
            body,
            style: ConstText.body(context),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: ConstSize.padding_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _valueItem(context,
              ConstStrings.valuesItem1Title, ConstStrings.valuesItem1Body),
          _valueItem(context,
              ConstStrings.valuesItem2Title, ConstStrings.valuesItem2Body),
          _valueItem(context,
              ConstStrings.valuesItem3Title, ConstStrings.valuesItem3Body),
        ],
      ),
    );
  }
}