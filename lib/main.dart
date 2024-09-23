import 'package:flutter/material.dart';
import 'package:movies_app/layout/layout_view.dart';
import 'package:movies_app/moduls/browse/widget/browse_list.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';
import 'package:movies_app/moduls/splash/splash_view.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';
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
        LayoutView.routeName: (BuildContext context) =>  const LayoutView(),
        DetailsScreen.routeName: (BuildContext context) =>  const DetailsScreen(),
/*        BrowseList.routeName: (BuildContext context) =>   BrowseList(),*/

      },
      initialRoute: SplashView.routeName,
    );
  }
}


