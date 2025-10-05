import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_strings_products.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';
import '../custom_button.dart';

class ProductsHeroSection extends StatelessWidget {
  const ProductsHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(ConstSize.padding_24),
      decoration: const BoxDecoration(gradient: ConstColors.heroGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ConstSize.productsHeroMaxW),
          child: LayoutBuilder(
            builder: (context, c) {
              final bool isWide = c.maxWidth >= ConstSize.heroBreakpoint;

              final Widget image = ClipRRect(
                borderRadius: BorderRadius.circular(ConstSize.heroImgRadius),
                child: AspectRatio(
                  aspectRatio: isWide ? 16 / 9 : 4 / 3, // أبعاد ثابتة للصغير
                  child: Image.asset(
                    ProductsPageStrings.productsHeroImage,
                    fit: BoxFit.cover,
                  ),
                ),
              );

              final Widget text = Padding(
                padding: const EdgeInsets.all(ConstSize.padding_16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      ConstStrings.servicesAndProducts,
                      style: ConstText.sectionTitle(context).copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    SelectableText(
                      ProductsPageStrings.productsHeroBody,
                      style: ConstText.body(context).copyWith(color: Colors.white70),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      title:  ProductsPageStrings.productsHeroButton,
                      onTap: () => Navigator.pushNamed(context, '/contact'),
                      color: ConstColors.mid,   // لون مختلف
                      hPadding: 40,             // زرار أعرض
                      vPadding: 18,             // أطول شوية
                    ),
                  ],
                ),
              );

              if (isWide) {
                // ✅ واسع: نستخدم Row + Expanded
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: text),
                    const SizedBox(width: 24),
                    Expanded(child: image),
                  ],
                );
              }

              // ✅ ضيّق: Column عادية بدون Flexible/Expanded
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  text,
                  const SizedBox(height: 16),
                  image,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}