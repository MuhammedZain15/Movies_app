import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/moduls/home/popular_manager/cubit.dart';
import 'package:movies_app/moduls/home/popular_manager/states.dart';
import 'package:movies_app/moduls/home/widget/New%20Releases/new_releases.dart';
import 'package:movies_app/moduls/home/widget/Popular/popular_widget.dart';
import 'package:movies_app/moduls/home/widget/Recomended/top_rated_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => PopularCubit()..getPopularMovies(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocConsumer<PopularCubit, PopularStates>(
              builder: (context, state) {
                var cubit = PopularCubit.get(context);
                if (cubit.popularList.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                  );
                }
                return CarouselSlider.builder(
                  itemCount: cubit.popularList.length,
                  options: CarouselOptions(
                    height: size.height * 0.30,
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
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return PopularWidget(movie: cubit.popularList[index]);
                  },
                );
              },
              listener: (BuildContext context, PopularStates state) {},
            ),
            NewReleases(),
            TopRatedWidget()
          ],
        ),
      ),
    );
  }
}
