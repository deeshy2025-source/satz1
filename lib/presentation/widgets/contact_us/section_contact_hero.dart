import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings_contact_us.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';
import '../custom_button.dart';

class SectionContactHero extends StatelessWidget {
  const SectionContactHero({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final double heroHeight = isWide ? 420 : 320;

    return Container(
      width: double.infinity,
      height: heroHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ContactUsStrings.contactHeroImage),
          fit: BoxFit.cover, // الصورة كخلفية كاملة
        ),
      ),
      padding: const EdgeInsets.all(ConstSize.padding_24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                ContactUsStrings.contactPageTitle,
                style: ConstText.sectionTitle(context).copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              SelectableText(
                ContactUsStrings.contactHeroBody,
                style: ConstText.body(context).copyWith(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    title: ConstStrings.servicesAndProducts,
                    onTap: () => Navigator.pushNamed(context, '/products'),
                    color: ConstColors.mid,   // لون مختلف
                    hPadding: 40,             // زرار أعرض
                    vPadding: 18,             // أطول شوية
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