import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
//import '../widgets/projects_section.dart';
//import '../widgets/expertise_section.dart';
//import '../widgets/services_section.dart';
//import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            const HeroSection() ,

            //AboutSection(),
           // ProjectsSection(),
            //ExpertiseSection(),
            //ServicesSection(),
            //Footer(),
          ],
        ),
      ),
    );
  }
}