import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';
import 'nav_logo.dart';
import 'nav_actions.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onHome;
  final VoidCallback? onExpertise;
  final VoidCallback? onServices;
  final VoidCallback? onAbout;
  final VoidCallback? onContact;

  const NavBar({
    super.key,
    this.onHome,
    this.onExpertise,
    this.onServices,
    this.onAbout,
    this.onContact,
  });

  @override
  Size get preferredSize => const Size.fromHeight(ConstSize.navbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool compact = constraints.maxWidth < ConstSize.navbarBreakpoint;

            return Container(
              height: preferredSize.height,
              padding: const EdgeInsets.symmetric(horizontal: ConstSize.padding_24),
              child: Row(
                children: [
                  const NavLogo(),
                  const Spacer(),
                  NavActions(
                    compact: compact,
                    onHome: onHome,
                    onExpertise: onExpertise,
                    onServices: onServices,
                    onAbout: onAbout,
                    onContact: onContact,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}