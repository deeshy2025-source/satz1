import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_strings.dart';

class NavEndDrawer extends StatelessWidget {
  const NavEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const ListTile(
              title: Text(ConstStrings.menu, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
            const Divider(),
            ListTile(
              title: const Text(ConstStrings.homepage),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text(ConstStrings.aboutUs),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text(ConstStrings.ourExpertise),
              onTap: () {
                Navigator.pop(context);

              },
            ),
            ListTile(
              title: const Text(ConstStrings.servicesAndProducts),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(ConstStrings.contactUs),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}