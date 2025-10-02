import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_colors.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_text.dart';
import '../custom_button.dart';
import 'feature_tile.dart';

class PrecisionSection extends StatelessWidget {
  const PrecisionSection({super.key});

  static const double _maxContentWidth = 1200;

  @override
  Widget build(BuildContext context) {
    final items = const [
      FeatureTile(
        icon: Icons.satellite_alt_outlined,
        title: 'RF & Microwave Components',
        text: 'High-reliability microwave design, satellite feed designs, mm-wave components.',
      ),
      FeatureTile(
        icon: Icons.settings_suggest_outlined,
        title: 'Mechanical Engineering Solutions',
        text: 'Components modeling, PIM analysis, precision assembly design.',
      ),
      FeatureTile(
        icon: Icons.precision_manufacturing_outlined,
        title: 'Prototyping & Fabrication',
        text: 'Fabless model; accuracy up to 0.0005".',
      ),
      FeatureTile(
        icon: Icons.fact_check_outlined,
        title: 'Testing & Validation',
        text: 'Thermal analysis, space-grade reliability tests, compliance checks.',
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: const BoxDecoration(
          gradient: ConstColors.heroGradient,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: Column(
            children: [
              Text('Precision Engineering for Aerospace & Defense',
                  style: ConstText.sectionTitle(context)
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(
                'Providing end-to-end solutions in satellite systems, RF/microwave components, and advanced prototyping.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, c) {
                  final isNarrow = c.maxWidth < 900;
                  final cross = isNarrow ? 1 : 2;
                  final gap = isNarrow ? 16.0 : 24.0;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cross,
                      mainAxisSpacing: gap,
                      crossAxisSpacing: gap,
                      childAspectRatio: isNarrow ? 2.8 : 2.6,
                    ),
                    itemCount: items.length,
                    itemBuilder: (_, i) => items[i],
                  );
                },
              ),
              const SizedBox(height: 28),
              CustomButton(
                title: ConstStrings.requestAQuote,
                onTap: () => Navigator.pushNamed(context, '/products'),
                color: ConstColors.mid,   // لون مختلف
                hPadding: 40,             // زرار أعرض
                vPadding: 18,             // أطول شوية
              ),
            ],
          ),
        ),
      ),
    );
  }
}