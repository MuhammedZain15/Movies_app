import 'package:flutter/material.dart';
import 'package:movies_app/layout/layout_view.dart';
import 'package:movies_app/moduls/splash/splash_view.dart';
import 'package:movies_app/services/theme/application_theme_manger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManger.defaultTheme,
      routes: {
        SplashView.routeName: (BuildContext context) => const SplashView(),
        LayoutView.routeName: (BuildContext context) =>  LayoutView(),

      },
      initialRoute: SplashView.routeName,
    );
  }
}


