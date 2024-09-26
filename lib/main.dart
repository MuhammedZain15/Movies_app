import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/layout/layout_view.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';
import 'package:movies_app/moduls/splash/splash_view.dart';
import 'package:movies_app/services/theme/application_theme_manger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favoritesBox');
WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ApplicationThemeManger.defaultTheme,
        routes: {
          SplashView.routeName: (BuildContext context) => const SplashView(),
          LayoutView.routeName: (BuildContext context) => const LayoutView(),
          DetailsScreen.routeName: (BuildContext context) =>
              const DetailsScreen(),
          /*        BrowseList.routeName: (BuildContext context) =>   BrowseList(),*/
        },
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
