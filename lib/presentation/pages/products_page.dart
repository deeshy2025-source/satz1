import 'package:flutter/material.dart';
import '../../core/constants/const_colors.dart';
import '../widgets/nav_bar/NavBar.dart';
import '../widgets/products_sections/section_products_hero.dart';
import '../widgets/products_sections/section_products_list.dart';
import '../widgets/satz_footer/satz_footer_section.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  void _navigateAfterDrawer(BuildContext context, String route, {Object? arguments}) {
    Navigator.pop(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      Navigator.pushNamed(context, route, arguments: arguments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ NavBar
      appBar: NavBar(
        onHome:      () => Navigator.pushNamed(context, '/'),
        onExpertise: () => Navigator.pushNamed(context, '/', arguments: 'expertise'),
        onServices:  () {}, // أنت بالفعل هنا
        onAbout:     () => Navigator.pushNamed(context, '/about'),
        onContact:   () => Navigator.pushNamed(context, '/contact'),
      ),

      // ✅ Drawer للشاشات الصغيرة
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: ConstColors.primary),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                title: const Text('HomePage'),
                onTap: () => _navigateAfterDrawer(context, '/'),
              ),
              ListTile(
                title: const Text('Our Expertise'),
                onTap: () => _navigateAfterDrawer(context, '/', arguments: 'expertise'),
              ),
              ListTile(
                title: const Text('Services & Products'),
                onTap: () { Navigator.pop(context); /* نفس الصفحة */ },
              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () => _navigateAfterDrawer(context, '/about'),
              ),
              ListTile(
                title: const Text('Contact Us'),
                onTap: () => _navigateAfterDrawer(context, '/contact'),
              ),
            ],
          ),
        ),
      ),

      backgroundColor: ConstColors.scaffoldBg,

      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProductsHeroSection(),   // الصورة الكبيرة فوق (satEarth2.jpeg + النص)
            ProductsListSection(),   // كروت المنتجات (product1.png .. إلخ)
            SatzFooter(),            // الفوتر الموحد
          ],
        ),
      ),
    );
  }
}