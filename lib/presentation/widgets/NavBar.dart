import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // position of logo
          Image.asset(
            "assets/images/logoLight.png",
            height: 100,
          ),

          // top nav bar
          Row(
            children: [
              _navItem("HomePage"),
              _navItem(" Our Expertise "),
              _navItem("Services & Products"),
              _navItemButton("About Us"),
              _navItemButton("Contact Us"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
  Widget _navItemButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          onPressed: (){},
          child: Text(title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
          ),),
    );
  }
}