import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';

class FooterLinksColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterLinksColumn({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: ConstColors.footerTitle,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );

    final itemStyle = TextStyle(
      color: ConstColors.footerText,
      fontSize: 16,
      height: 1.35,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        const SizedBox(height: ConstSize.footerSectionGap),
        ...items.map(
              (t) => Padding(
            padding: const EdgeInsets.only(bottom: ConstSize.footerItemSpacing),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("•  "), // نقطه سوداء بسيطة
                Expanded(child: Text(t, style: itemStyle)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}