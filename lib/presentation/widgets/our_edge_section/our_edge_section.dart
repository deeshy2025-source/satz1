import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_text.dart';
import 'edge_bullets_column.dart';
import 'edge_center_image.dart';
import 'edge_tilte.dart';


class SectionOurEdge extends StatelessWidget {
  const SectionOurEdge({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= ConstSize.edgeBreakpoint;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: ConstColors.heroGradient),
      padding: const EdgeInsets.all(ConstSize.edgePadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ConstSize.edgeMaxW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // العنوان الأساسي
              const EdgeTitle(),

              SizedBox(height: ConstSize.edgeTitleSpacing),

              // الشبكة الرئيسية
              if (isWide)
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // يسار: Technical Mastery
                    Expanded(
                      child: EdgeBulletsColumn(
                        title: ConstStrings.edgeLeftTitle,
                        boldItems: [
                          (ConstStrings.edgeLeftItem1Title, ConstStrings.edgeLeftItem1Body),
                          (ConstStrings.edgeLeftItem2Title, ConstStrings.edgeLeftItem2Body),
                        ],
                        normalItems: [],
                        intro: "",
                        alignStart: true,
                      ),
                    ),
                    SizedBox(width: ConstSize.edgeGap),

                    // منتصف: صورة
                    EdgeCenterImage(),

                    SizedBox(width: ConstSize.edgeGap),

                    // يمين: End-to-End Ownership
                    Expanded(
                      child: EdgeBulletsColumn(
                        title: ConstStrings.edgeRightTitle,
                        intro: ConstStrings.edgeRightIntro,
                        boldItems: [],
                        normalItems: ConstStrings.edgeRightBullets,
                        alignStart: false,
                      ),
                    ),
                  ],
                )
              else
              // موبايل/ضيق: ترتيب رأسي
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EdgeCenterImage(),
                    SizedBox(height: ConstSize.edgeGap),
                    EdgeBulletsColumn(
                      title: ConstStrings.edgeLeftTitle,
                      boldItems: [
                        (ConstStrings.edgeLeftItem1Title, ConstStrings.edgeLeftItem1Body),
                        (ConstStrings.edgeLeftItem2Title, ConstStrings.edgeLeftItem2Body),
                      ],
                      normalItems: [],
                      intro: "",
                      alignStart: true,
                    ),
                    SizedBox(height: ConstSize.edgeGap),
                    EdgeBulletsColumn(
                      title: ConstStrings.edgeRightTitle,
                      intro: ConstStrings.edgeRightIntro,
                      boldItems: [],
                      normalItems: ConstStrings.edgeRightBullets,
                      alignStart: false,
                    ),
                  ],
                ),

              const SizedBox(height: ConstSize.edgeTitleSpacing),

              // العنوان السفلي + البولتس
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ConstStrings.edgeBottomTitle,
                    style: ConstText.sectionTitle(context).copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: ConstSize.edgeSectionSpacing),
                  Text(
                    ConstStrings.edgeBottomIntro,
                    style: ConstText.body(context).copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: ConstSize.edgeSectionSpacing),
                  // bullets في سطرين/3 حسب العرض
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 8,
                    children: ConstStrings.edgeBottomBullets
                        .map((t) => Text("• $t",
                        style: ConstText.body(context).copyWith(color: Colors.white)))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}