import 'package:flutter/material.dart';
import 'package:satz1/presentation/widgets/contact_us/section_how_to_reach.dart';
import '../../core/constants/const_colors.dart';
import '../widgets/contact_us/section_contact_hero.dart';
import '../widgets/contact_us/section_quick_form.dart';
import '../widgets/nav_bar/NavBar.dart';
import '../widgets/satz_footer/satz_footer_section.dart';


class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void _navigateAfterDrawer(BuildContext context, String route,
      {Object? arguments}) {
    Navigator.pop(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      Navigator.pushNamed(context, route, arguments: arguments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        onHome: () => Navigator.pushNamed(context, '/'),
        onExpertise: () =>
            Navigator.pushNamed(context, '/', arguments: 'expertise'),
        onServices: () => Navigator.pushNamed(context, '/products'),
        onAbout: () => Navigator.pushNamed(context, '/about'),
        onContact: () {}, // نفس الصفحة
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: ConstColors.primary),
                child: Text('Menu',
                    style: TextStyle(
                        color: ConstColors.testBasicColor, fontSize: 24)),
              ),
              ListTile(
                  title: const Text('HomePage'),
                  onTap: () => _navigateAfterDrawer(context, '/')),
              ListTile(
                  title: const Text('Our Expertise'),
                  onTap: () => _navigateAfterDrawer(context, '/',
                      arguments: 'expertise')),
              ListTile(
                  title: const Text('Services & Products'),
                  onTap: () => _navigateAfterDrawer(context, '/products')),
              ListTile(
                  title: const Text('About Us'),
                  onTap: () => _navigateAfterDrawer(context, '/about')),
              ListTile(
                  title: const Text('Contact Us'),
                  onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
      backgroundColor: ConstColors.scaffoldBg,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SectionContactHero(),
            SectionHowToReach(),
            SectionQuickForm(),
            SatzFooter(),
          ],
        ),
      ),
    );
  }
}