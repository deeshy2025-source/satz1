import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_text.dart';
import 'package:satz1/presentation/widgets/ourexpertize/expertise_card.dart';

import '../../../core/constants/const_colors.dart';

class ExpertiseBand extends StatelessWidget {
  const ExpertiseBand({super.key});

  static const double _maxContentWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // 👇 كبّري المنطقة: padding أكبر + حد أدنى للارتفاع
      padding: const EdgeInsets.symmetric(vertical: 56),
      constraints: const BoxConstraints(minHeight: 420),
      decoration: const BoxDecoration(gradient: ConstColors.expertiseGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: const ExpertiseContent(),
        ),
      ),
    );
  }
}

class ExpertiseContent extends StatelessWidget {
  const ExpertiseContent({super.key});

  static const double _cardMinHeightNarrow = 220; // للهواتف

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isNarrow = c.maxWidth < 900;

        final cards = const [
          ExpertiseCard(
            title: "Electrical Engineering for Satellite Communication",
            points: [
              "High-reliability Microwave components design",
              "Satellite feed designs",
              "Ferrite-based components",
              "mm-wave components",
              "Corrugated horn antennas",
            ],
          ),
          ExpertiseCard(
            title: "Mechanical Engineering Solutions",
            points: [
              "Components Modeling",
              "PIM analysis",
              "Assembly design",
            ],
          ),
          ExpertiseCard(
            title: "Prototyping & Testing",
            points: [
              "Fabless company with strong ties to machine shops",
              "Fabrication accuracy up to 0.0005-inch tolerances",
            ],
          ),
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Our Expertise",
                style: ConstText.sectionTitle(context)),
            const SizedBox(height: 8),
            const Text(
              "Pioneering the design and implementation of cutting-edges, stems",
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 28),

            // ====== بطاقات بنفس الارتفاع ======
            if (isNarrow) ...[
              // عمودي: نفس الطول تقريبًا بحد أدنى ثابت
              for (int i = 0; i < cards.length; i++) ...[
                ConstrainedBox(
                  constraints:
                  const BoxConstraints(minHeight: _cardMinHeightNarrow),
                  child: cards[i],
                ),
                if (i != cards.length - 1) const SizedBox(height: 16),
              ]
            ] else ...[
              // أفقي: كلهم نفس ارتفاع أطول بطاقة
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: _Fill(card: cards[0])),
                    const SizedBox(width: 30),
                    Expanded(child: _Fill(card: cards[1])),
                    const SizedBox(width: 30),
                    Expanded(child: _Fill(card: cards[2])),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

/// تجعل الطفل يملأ الارتفاع المتاح داخل IntrinsicHeight
class _Fill extends StatelessWidget {
  final Widget card;
  const _Fill({required this.card});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: card);
  }
}