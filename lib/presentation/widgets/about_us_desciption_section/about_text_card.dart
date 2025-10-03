import 'package:flutter/material.dart';
import '../../../../core/constants/const_size.dart';
import '../../../../core/constants/const_text.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/constants/const_colors.dart';
import '../custom_button.dart';

class AboutTextCard extends StatelessWidget {
  const AboutTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x171C163C), // طبقة غامقة خفيفة فوق التدرّج
        borderRadius: BorderRadius.circular(ConstSize.aboutCardRadius),
      ),
      padding: const EdgeInsets.all(ConstSize.aboutCardPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          Text(
            ConstStrings.aboutUsTitle,
            style: ConstText.heroSub(context),
          ),
          const SizedBox(height: 12),

          // النص
          Text(
            ConstStrings.aboutUsBody,
            style: ConstText.subHeadline(context),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // زرار
          // Center(
          //   child: ElevatedButton(
          //
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: ConstColors.primary,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(ConstSize.aboutButtonRadius),
          //       ),
          //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          //       elevation: 0,
          //     ),
          //     child: Text(
          //       ConstStrings.contactUs,
          //       style: ConstText.navButtonText(context),
          //     ),
          //   ),
          // ),
          Center(
            child: CustomButton(
              title: ConstStrings.contactUs,
              color: ConstColors.primary,   // تقدر تغيّره حسب الزرار
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ),
        ],

      ),
    );
  }
}