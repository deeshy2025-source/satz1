import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:satz1/core/constants/const_colors.dart';
import 'package:satz1/presentation/pages/about_us_page.dart';
import 'package:satz1/presentation/pages/contact_us_page.dart';
import 'package:satz1/presentation/pages/privacy_page.dart';
import 'package:satz1/presentation/pages/products_page.dart';
import 'package:satz1/presentation/pages/terms_page.dart';
import 'firebase_options.dart';
import 'presentation/pages/home_page.dart';
import 'package:flutter/gestures.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,     // ← مهم للماوس
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyScrollBehavior(),
      title: 'SATZ Tech',
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(backgroundColor: ConstColors.lightColor),
        primarySwatch: Colors.deepPurple,
      ),
      routes:{
        '/':(context)=>  HomePage(),
        '/about':(context)=> const AboutUsPage(),
        '/contact':(context)=> const ContactUsPage(),
        '/products':(context)=> const ProductsPage(),
        '/privacy':(context)=> const PrivacyPolicyPage(),
        '/terms':(context)=> const TermsPage(),

      },
      initialRoute: '/',
     // home: const HomePage(),
    );
  }
}