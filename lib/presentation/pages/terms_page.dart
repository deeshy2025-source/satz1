import 'package:flutter/material.dart';
import '../../core/constants/const_colors.dart';
import '../../core/constants/const_size.dart';
import '../../core/constants/const_strings_terms_page.dart';
import '../../core/constants/const_text.dart';
import '../../core/constants/const_strings.dart';
import '../widgets/nav_bar/NavBar.dart';
import '../widgets/satz_footer/satz_footer_section.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
              ListTile(title: const Text('HomePage'),            onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/'); }),
              ListTile(title: const Text('Our Expertise'),       onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/', arguments: 'expertise'); }),
              ListTile(title: const Text('Services & Products'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/products'); }),
              ListTile(title: const Text('About Us'),            onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/about'); }),
              ListTile(title: const Text('Contact Us'),          onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/contact'); }),
              ListTile(title: const Text('Terms & Conditions'),  onTap: () { Navigator.pop(context); /* أنتِ هنا */ }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero صغيرة
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
                      Text(TermsPageStrings.termsTitle,
                          style: ConstText.sectionTitle(context).copyWith(color: Colors.white, fontSize: 32)),
                      const SizedBox(height: 8),
                      Text('${TermsPageStrings.termsLastUpdatedLabel} ${TermsPageStrings.termsLastUpdatedDate}',
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
                  child: const _TermsBody(),
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

class _TermsBody extends StatelessWidget {
  const _TermsBody();

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
        p(TermsPageStrings.termsIntro),

        h(TermsPageStrings.termsUseTitle),
        p(TermsPageStrings.termsUseBody),

        h(TermsPageStrings.termsAccountsTitle),
        p(TermsPageStrings.termsAccountsBody),

        h(TermsPageStrings.termsIPTitle),
        p(TermsPageStrings.termsIPBody),

        h(TermsPageStrings.termsLinksTitle),
        p(TermsPageStrings.termsLinksBody),

        h(TermsPageStrings.termsTerminationTitle),
        p(TermsPageStrings.termsTerminationBody),

        h(TermsPageStrings.termsDisclaimerTitle),
        p(TermsPageStrings.termsDisclaimerBody),

        h(TermsPageStrings.termsLiabilityTitle),
        p(TermsPageStrings.termsLiabilityBody),

        h(TermsPageStrings.termsGoverningLawTitle),
        p(TermsPageStrings.termsGoverningLawBody),

        h(TermsPageStrings.termsChangesTitle),
        p(TermsPageStrings.termsChangesBody),

        h(TermsPageStrings.termsContactTitle),
        p('${TermsPageStrings.termsContactBody}\n${ConstStrings.companyEmail}'),
      ],
    );
  }
}