import 'package:flutter/material.dart';
import 'package:projeto_flutter/pages/home_page/home_page.dart';
import 'package:projeto_flutter/pages/login_page/login_page.dart';
import 'package:projeto_flutter/pages/my_home_page/my_home_page.dart';
import 'package:projeto_flutter/pages/recover_password_page/recover_password_page.dart';
import 'package:projeto_flutter/pages/singUp_page/signUp_page.dart';
import 'package:projeto_flutter/pages/splash_page/splash_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 2200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      title: 'Porkin I.O.',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashPage.splash: (_) => const SplashPage(),
        HomePage.home: (_) => const HomePage(),
        MyHomePage.myHome: (_) => const MyHomePage(),
        LoginPage.login: (_) => const LoginPage(),
        RecoverPasswordPage.recover: (_) => const RecoverPasswordPage(),
        SignUpPage.signUp: (_) => const SignUpPage(),
      },
    );
  }
}
