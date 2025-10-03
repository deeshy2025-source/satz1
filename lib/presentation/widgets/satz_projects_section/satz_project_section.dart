import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';
import '../custom_button.dart';

class SatzProjects extends StatelessWidget {
  const SatzProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(ConstSize.projectsPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth >= 900;

              final double imgW = isWide
                  ? (c.maxWidth * ConstSize.projectsImageFracW)
                  .clamp(0, ConstSize.projectsImageMaxW)
                  .toDouble()
                  : c.maxWidth;

              final image = ClipRRect(
                borderRadius:
                BorderRadius.circular(ConstSize.projectsImageRadius),
                child: SizedBox(
                  width: imgW,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      ConstStrings.satzProjectsImage, // assets/images/sat1.jpeg
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );

              final textCol = Column(
                crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ConstStrings.satzProjectsTitle,
                      style: ConstText.sectionTitle(context)),
                  const SizedBox(height: 12),
                  Text(
                    ConstStrings.satzProjectsBody,
                    style: ConstText.body(context),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: ConstStrings.satzProjectsButton,
                    onTap: () => Navigator.pushNamed(context, '/products'),
                    color: ConstColors.mid,   // لون مختلف
                    hPadding: 40,             // زرار أعرض
                    vPadding: 18,             // أطول شوية
                  ),
                ],
              );

              return isWide
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image,
                  const SizedBox(width: ConstSize.projectsGap),
                  Expanded(child: textCol), // النص يتمدّد بدون Overflow
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  image,
                  const SizedBox(height: ConstSize.projectsGap),
                  textCol, // في العمودي بدون Expanded لتجنب ضغط رأسي
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}