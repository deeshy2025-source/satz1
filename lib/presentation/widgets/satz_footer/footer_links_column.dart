import 'package:flutter/material.dart';
import '../../../core/constants/const_text.dart';

class FooterLinksColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterLinksColumn({
    super.key,
    required this.title,
    required this.items,
  });

  void _handleTap(BuildContext context, String label) {
    final l = label.toLowerCase().trim();

    if (l.contains('terms'))   { Navigator.pushNamed(context, '/terms');   return; }
    if (l.contains('privacy')) {
      Navigator.pushNamed(context, '/privacy'); // ← جديد
      return;
    }
    if (l.contains('policy')) {
      Navigator.pushNamed(context, '/privacy'); // ← احتياط
      return;
    }
    if (l.contains('home')) {
      Navigator.pushNamed(context, '/', arguments: 'home');
      return;
    }
    if (l.contains('expertise')) {
      Navigator.pushNamed(context, '/', arguments: 'expertise');
      return;
    }
    if (l.contains('service') || l.contains('product')) {
      Navigator.pushNamed(context, '/products');
      return;
    }
    if (l.contains('about')) {
      Navigator.pushNamed(context, '/about');
      return;
    }
    if (l.contains('contact')) {
      Navigator.pushNamed(context, '/contact');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double _tapMinHeight = 36; // 👈 مساحة ضغط أصغر
    const EdgeInsets _hp = EdgeInsets.symmetric(horizontal: 6, vertical: 4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: ConstText.body(context).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 15, // 👈 أصغر شوية من sectionTitle
            ),
          ),
        ),
        for (final it in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                hoverColor: Colors.black.withValues(alpha: 0.05),
                onTap: () => _handleTap(context, it),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: _tapMinHeight),
                  child: Padding(
                    padding: _hp,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          it,
                          style: ConstText.body(context).copyWith(
                            fontSize: 14, // 👈 النصوص أصغر
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}