import 'package:flutter/material.dart';
import '../../core/constants/const_colors.dart';
import '../../core/constants/const_size.dart';

import '../widgets/hero_section/hero_section.dart';
import '../widgets/nav_bar/NavBar.dart';
import '../widgets/ourexpertize/expertise_widget.dart';
import '../widgets/precision_section/precesion_section.dart';
import '../widgets/satz_footer/satz_footer_section.dart';
import '../widgets/satz_projects_section/satz_project_section.dart';
import '../widgets/under_hero_section/under_hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _topKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (args) {
          case 'expertise':
            _scrollTo(_expertiseKey);
            break;
          case 'projects':
            _scrollTo(_projectsKey);
            break;
          case 'contact':
            _scrollTo(_footerKey);
            break;
          case 'home':
            _scrollTo(_topKey);
            break;
        }
      });
    }
  }

  ListTile _drawerItem(String title, VoidCallback onTap) {
    return ListTile(title: Text(title), onTap: onTap);
  }

  void _navigateAfterDrawer(String route, {Object? arguments}) {
    Navigator.pop(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.pushNamed(context, route, arguments: arguments);
    });
  }

  void _drawerScroll(GlobalKey key) {
    Navigator.pop(context);
    Future.microtask(() => _scrollTo(key));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.scaffoldBg,
      appBar: NavBar(
        onHome: () => _scrollTo(_topKey),
        onExpertise: () => _scrollTo(_expertiseKey),
        onServices: () => Navigator.pushNamed(context, '/products'),
        onAbout: () => Navigator.pushNamed(context, '/about'),
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
              _drawerItem('HomePage', () => _drawerScroll(_topKey)),
              _drawerItem('Our Expertise', () => _drawerScroll(_expertiseKey)),
              _drawerItem('Services & Products',
                      () => _navigateAfterDrawer('/products')),
              _drawerItem('About Us', () => _navigateAfterDrawer('/about')),
              _drawerItem('Contact Us', () => _navigateAfterDrawer('/contact')),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            KeyedSubtree(key: _topKey, child: const SizedBox.shrink()),
            const HeroSection(),
            const UnderHero(),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: ConstSize.padding_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SatzProjects(key: _projectsKey),
                  ExpertiseBand(key: _expertiseKey),
                  const PrecisionSection(),
                ],
              ),
            ),
            SatzFooter(key: _footerKey),
          ],
        ),
      ),
    );
  }
}