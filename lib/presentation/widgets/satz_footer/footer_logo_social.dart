import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/const_colors.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings.dart';

class FooterLogoSocial extends StatelessWidget {
  const FooterLogoSocial({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // اللوجو
        SvgPicture.asset(
          ConstStrings.logoLight,
          height: ConstSize.footerLogoHeight,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
              ConstColors.primary,
              BlendMode.srcIn
          ),
        ),

        const SizedBox(height: 16),

        // أيقونات السوشيال بالألوان الأصلية
        //
        // Row(
        //   children: [
        //     _socialIcon('assets/icons/twitter.svg', 'https://twitter.com/YourPage'),
        //     const SizedBox(width: 12),
        //     _socialIcon('assets/icons/instagram.svg', 'https://instagram.com/YourPage'),
        //     const SizedBox(width: 12),
        //     _socialIcon('assets/icons/linkedin.svg', 'https://linkedin.com/company/YourPage'),
        //     const SizedBox(width: 12),
        //     _socialIcon('assets/icons/youtube.svg', 'https://youtube.com/@YourPage'),
        //     const SizedBox(width: 12),
        //     _socialIcon('assets/icons/facebook.svg', 'https://facebook.com/YourPage'),
        //   ],
        // ),
      ],
    );
  }

  Widget _socialIcon(String assetPath, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: SvgPicture.asset(
        assetPath,
        height: ConstSize.footerIconSize,
        width: ConstSize.footerIconSize,
        // 👇 متشليش/تضيفي colorFilter → الألوان الأصلية هتظهر
      ),
    );
  }
}