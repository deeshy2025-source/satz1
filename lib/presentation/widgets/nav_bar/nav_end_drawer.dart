import 'package:flutter/material.dart';

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
              title: Text('Menu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
            const Divider(),
            ListTile(
              title: const Text('HomePage'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Our Expertise'),
              onTap: () {
                Navigator.pop(context);

              },
            ),
            ListTile(
              title: const Text('Services & Products'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
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