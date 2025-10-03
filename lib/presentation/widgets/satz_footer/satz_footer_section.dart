import 'package:flutter/material.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import 'footer_logo_social.dart';
import 'footer_links_column.dart';
import 'footer_bottom_bar.dart';
import '../../../core/constants/const_strings.dart';

class SatzFooter extends StatelessWidget {
  const SatzFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstColors.footerBg,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: ConstSize.footerPaddingH,
        vertical: ConstSize.footerPaddingV,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ConstSize.footerMaxWidth),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth >= ConstSize.footerBreakpoint;

              final columns = [
                // اللوجو + السوشيال
                const Expanded(
                  flex: 3,
                  child: FooterLogoSocial(),
                ),

                const SizedBox(width: ConstSize.footerGutter),

                // Quick Links
                Expanded(
                  flex: 2,
                  child: FooterLinksColumn(
                    title: ConstStrings.footerQuickLinksTitle,
                    items: ConstStrings.footerQuickLinks,
                  ),
                ),

                const SizedBox(width: ConstSize.footerGutter),

                // Contact
                Expanded(
                  flex: 2,
                  child: FooterLinksColumn(
                    title: ConstStrings.footerContactTitle,
                    items: ConstStrings.footerContact,
                  ),
                ),

                const SizedBox(width: ConstSize.footerGutter),

                // Legal
                Expanded(
                  flex: 2,
                  child: FooterLinksColumn(
                    title: ConstStrings.footerLegalTitle,
                    items: ConstStrings.footerLegal,
                  ),
                ),
              ];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isWide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: columns,
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FooterLogoSocial(),
                        const SizedBox(height: ConstSize.footerGutter),

                        FooterLinksColumn(
                          title: ConstStrings.footerQuickLinksTitle,
                          items: ConstStrings.footerQuickLinks,
                        ),
                        const SizedBox(height: ConstSize.footerGutter),

                        FooterLinksColumn(
                          title: ConstStrings.footerContactTitle,
                          items: ConstStrings.footerContact,
                        ),
                        const SizedBox(height: ConstSize.footerGutter),

                        FooterLinksColumn(
                          title: ConstStrings.footerLegalTitle,
                          items: ConstStrings.footerLegal,
                        ),
                      ],
                    ),

                  const SizedBox(height: ConstSize.footerGutter),

                  // خط فاصل خفيف
                  Container(height: 1, color: ConstColors.footerDivider),

                  const SizedBox(height: ConstSize.footerBottomPadding),

                  const FooterBottomBar(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
