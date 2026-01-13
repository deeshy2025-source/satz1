import 'package:flutter/material.dart';
import '../../core/constants/const_colors.dart';
import '../widgets/about_us_desciption_section/about_us_description.dart';
import '../widgets/mission_and_vision_section/mission_vision_section.dart';
import '../widgets/our_edge_section/our_edge_section.dart';
import '../widgets/our_values_section/our_values_section.dart';
import '../widgets/nav_bar/NavBar.dart';
import '../widgets/satz_footer/satz_footer_section.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
        onAbout: () {}, // نفس الصفحة
        onContact: () => Navigator.pushNamed(context, '/contact'),
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
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: const Text('Contact Us'),
                  onTap: () => _navigateAfterDrawer(context, '/contact')),
            ],
          ),
        ),
      ),
      backgroundColor: ConstColors.scaffoldBg,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SectionAboutUs(),
            MissionVisionSection(),
            SectionOurEdge(),
            SectionOurValues(),
            SatzFooter(),
          ],
        ),
      ),
    );
  }
}