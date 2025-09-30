import 'package:flutter/material.dart';
import '../../../core/constants/const_text.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_colors.dart';

class NavActions extends StatelessWidget {
  final bool compact;

  // (اختياري) لو حابة توصّلي الروابط لـ scroll callbacks:
  final VoidCallback? onHome;
  final VoidCallback? onExpertise;
  final VoidCallback? onServices;
  final VoidCallback? onAbout;
  final VoidCallback? onContact;

  const NavActions({
    super.key,
    required this.compact,
    this.onHome,
    this.onExpertise,
    this.onServices,
    this.onAbout,
    this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    if (!compact) {
      return Row(
        children: [
          _NavLink('HomePage', onTap: onHome ?? () {}),
          _NavLink('Our Expertise', onTap: onExpertise ?? () {}),
          _NavLink('Services & Products', onTap: onServices ?? () {}),
          _NavButton('About Us', onTap: onAbout ?? () {},buttonColor:ConstColors.mid ,),
          _NavButton('Contact Us', onTap: onContact ?? () {},buttonColor: ConstColors.primary),
        ],
      );
    }

    // شاشة صغيرة → زرار Menu يفتح endDrawer
    return Builder(
      builder: (ctx) => IconButton(
        icon: const Icon(Icons.menu, color: ConstColors.primary),
        tooltip: 'Menu',
        onPressed: () => Scaffold.of(ctx).openEndDrawer(),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _NavLink(this.title, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ConstSize.navItemGap),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.black.withValues(alpha: 0.04),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title, style: ConstText.navLinkStyle(context)),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color buttonColor;
  const _NavButton(this.title, {required this.onTap,required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ConstSize.navItemGapSm),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: ConstColors.colorWhite,
          padding: const EdgeInsets.symmetric(
            horizontal: ConstSize.buttonHPadding,
            vertical: ConstSize.buttonVPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ConstSize.buttonRadius),
          ),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(title, style: ConstText.navButtonText(context)),
      ),
    );
  }
}