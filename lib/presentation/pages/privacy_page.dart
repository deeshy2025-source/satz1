import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_strings_privacy_page.dart';
import '../../core/constants/const_colors.dart';
import '../../core/constants/const_size.dart';
import '../../core/constants/const_text.dart';
import '../../core/constants/const_strings.dart';
import '../widgets/nav_bar/NavBar.dart';
import '../widgets/satz_footer/satz_footer_section.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.scaffoldBg,
      appBar: NavBar(
        onHome:      () => Navigator.pushNamed(context, '/'),
        onExpertise: () => Navigator.pushNamed(context, '/', arguments: 'expertise'),
        onServices:  () => Navigator.pushNamed(context, '/products'),
        onAbout:     () => Navigator.pushNamed(context, '/about'),
        onContact:   () => Navigator.pushNamed(context, '/contact'),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: ConstColors.primary),
                child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(title: const Text('HomePage'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/'); }),
              ListTile(title: const Text('Capabilities'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/', arguments: 'expertise'); }),
              ListTile(title: const Text('Services & Products'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/products'); }),
              ListTile(title: const Text('About Us'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/about'); }),
              ListTile(title: const Text('Contact Us'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/contact'); }),
              ListTile(title: const Text('Privacy Policy'), onTap: () { Navigator.pop(context); /* أنتِ هنا */ }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // هيرو صغيرة بسيطة
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: ConstSize.padding_24,
                vertical: 48,
              ),
              decoration: const BoxDecoration(gradient: ConstColors.heroGradient),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(PrivacyStrings.privacyTitle,
                          style: ConstText.sectionTitle(context).copyWith(color: Colors.white, fontSize: 32)),
                      const SizedBox(height: 8),
                      Text('${PrivacyStrings.privacyLastUpdatedLabel} ${PrivacyStrings.privacyLastUpdatedDate}',
                          style: ConstText.body(context).copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),

            // المحتوى
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: ConstSize.padding_16,
                vertical: ConstSize.sectionGap,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: const _PrivacyBody(),
                ),
              ),
            ),

            const SatzFooter(),
          ],
        ),
      ),
    );
  }
}

class _PrivacyBody extends StatelessWidget {
  const _PrivacyBody();

  @override
  Widget build(BuildContext context) {
    Widget h(String t) => Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(t, style: ConstText.sectionTitle(context).copyWith(fontSize: 22)),
    );
    Widget p(String t) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(t, style: ConstText.body(context), textAlign: TextAlign.justify),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        p(PrivacyStrings.privacyIntro),

        h(PrivacyStrings.privacyCollectTitle),
        p(PrivacyStrings.privacyCollectBody),

        h(PrivacyStrings.privacyUseTitle),
        p(PrivacyStrings.privacyUseBody),

        h(PrivacyStrings.privacyCookiesTitle),
        p(PrivacyStrings.privacyCookiesBody),

        h(PrivacyStrings.privacySharingTitle),
        p(PrivacyStrings.privacySharingBody),

        h(PrivacyStrings.privacySecurityTitle),
        p(PrivacyStrings.privacySecurityBody),

        h(PrivacyStrings.privacyRightsTitle),
        p(PrivacyStrings.privacyRightsBody),

        h(PrivacyStrings.privacyContactTitle),
        p('${PrivacyStrings.privacyContactBody}\n${ConstStrings.companyEmail}'),
      ],
    );
  }
}