// lib/presentation/widgets/products/section_products_list.dart
import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_colors.dart';
import '../custom_button.dart';


class ProductsListSection extends StatelessWidget {
  const ProductsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ProductItem(
        image: ConstStrings.productSSPAImage,
        title: ConstStrings.prodSSPATitle,
        body: ConstStrings.prodSSPABody,
      ),
      ProductItem(
        image: ConstStrings.productMonoImage,
        title: ConstStrings.prodMonoTitle,
        body: ConstStrings.prodMonoBody,
      ),
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: ConstSize.padding_24,        // هوامش جانبية متماثلة
        vertical: ConstSize.sectionGap,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            // وسّعنا العرض شوية عشان يملأ مساحة أكبر والهوامش تكون متساوية
            maxWidth: 1280,
          ),
          child: LayoutBuilder(
            builder: (context, c) {
              final bool narrow = c.maxWidth < 900;

              return Column(
                children: [
                  for (int i = 0; i < items.length; i++) ...[
                    _ProductRow(
                      item: items[i],
                      imageLeft: !narrow && i.isEven,
                      narrow: narrow,
                    ),
                    const SizedBox(height: ConstSize.sectionGap),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProductItem {
  final String image;
  final String title;
  final String body;
  ProductItem({required this.image, required this.title, required this.body});
}

class _ProductRow extends StatelessWidget {
  final ProductItem item;
  final bool imageLeft;
  final bool narrow;

  const _ProductRow({
    required this.item,
    required this.imageLeft,
    required this.narrow,
  });

  @override
  Widget build(BuildContext context) {
    // ===== بطاقة الصورة (Gradient خلفية + الصورة أصغر لتبان الحافة) =====
    final imgCard = Container(
      decoration: BoxDecoration(
        gradient: ConstColors.heroGradient,
        borderRadius: BorderRadius.circular(ConstSize.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.all(16), // 👈 كبّرنا البادينج عشان الإطار يظهر أكتر
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ConstSize.cardRadius - 8),
        child: AspectRatio(
          // نخلي الصورة أصغر شوية وثابتة النسبة
          aspectRatio: narrow ? 4 / 3 : 16 / 9,
          child: Image.asset(item.image, fit: BoxFit.cover),
        ),
      ),
    );

    // ===== النص وزرار الاقتباس =====
    final txt = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: ConstText.sectionTitle(context)),
        const SizedBox(height: 8),
        Text(item.body, style: ConstText.body(context), textAlign: TextAlign.justify),
        const SizedBox(height: 12),
        CustomButton(
          title: ConstStrings.requestQuote,
          onTap: () => Navigator.pushNamed(context, '/contact'),
          color: ConstColors.primary,
          hPadding: 28,
          vPadding: 12,
        ),
      ],
    );

    if (narrow) {
      // 📱 شاشات ضيّقة: عمود بدون Expanded
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          imgCard,
          const SizedBox(height: 16),
          txt,
        ],
      );
    }

    // 🖥️ شاشات واسعة: استخدمنا Expanded عشان يملأ العرض ويتساوى الهامشين
    final left = imageLeft
        ? Expanded(flex: 5, child: imgCard)
        : Expanded(flex: 6, child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: txt,
    ));

    final right = imageLeft
        ? Expanded(flex: 6, child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: txt,
    ))
        : Expanded(flex: 5, child: imgCard);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        left,
        const SizedBox(width: 24),
        right,
      ],
    );
  }
}