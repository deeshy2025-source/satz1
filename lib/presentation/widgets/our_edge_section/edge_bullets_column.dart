import 'package:flutter/material.dart';
import '../../../../core/constants/const_text.dart';
import '../../../../core/constants/const_size.dart';

/// عمود مرن لعرض عنوان + (اختياري) Intro + bullets.
/// - boldItems: عناصر فيها جزء بولد (title) ثم body عادي.
/// - normalItems: عناصر نص عادي.
class EdgeBulletsColumn extends StatelessWidget {
  final String title;
  final String intro;
  final List<(String, String)> boldItems; // (boldTitle, body)
  final List<String> normalItems;
  final bool alignStart;

  const EdgeBulletsColumn({
    super.key,
    required this.title,
    required this.intro,
    required this.boldItems,
    required this.normalItems,
    this.alignStart = true,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = ConstText.sectionTitle(context).copyWith(color: Colors.white);
    final bodyStyle  = ConstText.body(context).copyWith(color: Colors.white);

    return Column(
      crossAxisAlignment:
      alignStart ? CrossAxisAlignment.start : CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        const SizedBox(height: ConstSize.edgeSectionSpacing),

        if (intro.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: ConstSize.edgeSectionSpacing),
            child: Text(intro,
                style: ConstText.body(context).copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
          ),

        // عناصر ببداية بولد
        ...boldItems.map(
              (b) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("•  ", style: TextStyle(color: Colors.white)),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: bodyStyle,
                      children: [
                        TextSpan(
                          text: b.$1,
                          style: bodyStyle.copyWith(fontWeight: FontWeight.w800),
                        ),
                        TextSpan(text: b.$2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // عناصر نص عادي
        ...normalItems.map(
              (t) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("•  ", style: TextStyle(color: Colors.white)),
                Expanded(child: Text(t, style: bodyStyle)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}