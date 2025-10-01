import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_text.dart';


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

              final image = ClipRRect(
                borderRadius: BorderRadius.circular(ConstSize.projectsImageRadius),
                child: SizedBox(
                  width: isWide ? ConstSize.projectsImageWidth : double.infinity,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      ConstStrings.satzProjectsImage, // ✅ sat1.jpeg
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );

              final textBlock = Expanded(
                child: Column(
                  crossAxisAlignment:
                  isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ConstStrings.satzProjectsTitle,
                        style: ConstText.sectionTitle(context)),
                    const SizedBox(height: 12),
                    Text(ConstStrings.satzProjectsBody,
                        style: ConstText.body(context),
                        textAlign: TextAlign.justify),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ConstColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              ConstSize.projectsButtonRadius),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(ConstStrings.satzProjectsButton,
                          style: ConstText.navButtonText(context)),
                    ),
                  ],
                ),
              );

              return isWide
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image,
                  SizedBox(width: ConstSize.projectsGap),
                  textBlock,
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image,
                  SizedBox(height: ConstSize.projectsGap),
                  textBlock,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}