import 'package:flutter/material.dart';
import 'package:movies_app/layout/layout_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
static const String routeName = "splash_view";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover),
      ),
    );
  }
}
