import 'package:flutter/material.dart';
import 'package:satz1/presentation/widgets/ourexpertize/expertise_widget.dart';

// ثوابت
import '../../core/constants/const_colors.dart';
import '../../core/constants/const_size.dart';
import '../../core/constants/const_strings.dart';
import '../../core/constants/const_text.dart';


// Widgets
import '../widgets/hero_section/hero_section.dart';
import '../widgets/nav_bar/NavBar.dart';
// ✅ مهم: خلي مسار الـ NavBar lowercase


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.scaffoldBg,
      appBar: const NavBar(),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: ConstColors.primary),
              child: Text('Menu', style: TextStyle(color: ConstColors.testBasicColor, fontSize: 24)),
            ),
            ListTile(title: Text('HomePage')),
            ListTile(title: Text('Our Expertise')),
            ListTile(title: Text('Services & Products')),
            ListTile(title: Text('About Us')),
            ListTile(title: Text('Contact Us')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ConstSize.padding_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [

              HeroSection(),

              SectionOne(),

             ExpertiseBand(),

              SectionThree(),

            ],
          ),
        ),
      ),
    );
  }
}

class SectionOne extends StatelessWidget {
  const SectionOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstSize.sectionHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConstColors.sectionBg1,
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Text(ConstStrings.sectionOneTitle, style: ConstText.sectionTitle(context)),
    );
  }
}

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstSize.sectionHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConstColors.sectionBg2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(ConstStrings.sectionTwoTitle, style: ConstText.sectionTitle(context)),
    );
  }
}

class SectionThree extends StatelessWidget {
  const SectionThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstSize.sectionHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConstColors.sectionBg3,
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Text(ConstStrings.sectionThreeTitle, style: ConstText.sectionTitle(context)),
    );
  }
}