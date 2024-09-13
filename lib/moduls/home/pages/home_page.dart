import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/widget/New%20Releases/new_releases.dart';
import 'package:movies_app/moduls/home/widget/Popular/popular_widget.dart';
import 'package:movies_app/moduls/home/widget/Recomended/top_rated_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CarouselSlider(
            items: [
              PopularWidget(),
              PopularWidget(),
              PopularWidget(),

            ],
            options: CarouselOptions(
              height:  size.height * 0.30,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 600),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )
        ),
        NewReleases(),
        TopRatedWidget()


      ],
    );
  }
}
