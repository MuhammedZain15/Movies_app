import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/moduls/home/popular_manager/cubit.dart';
import 'package:movies_app/moduls/home/popular_manager/states.dart';
import 'package:movies_app/moduls/home/recommended_manager/cubit.dart';
import 'package:movies_app/moduls/home/recommended_manager/states.dart';
import 'package:movies_app/moduls/home/upcoming_manager/cubit.dart';
import 'package:movies_app/moduls/home/upcoming_manager/states.dart';
import 'package:movies_app/moduls/home/widget/New%20Releases/new_releases.dart';
import 'package:movies_app/moduls/home/widget/Popular/popular_widget.dart';
import 'package:movies_app/moduls/home/widget/Recomended/top_rated_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PopularCubit()..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) => UpComingCubit()..getUpComingMovies(),
        ),
        BlocProvider(
          create: (context) => RecommendedCubit()..getRecommendedList(),
        ),
      ],
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocConsumer<PopularCubit, PopularStates>(
                builder: (context, state) {
                  var cubit = PopularCubit.get(context);
                  if (cubit.popularList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ),
                    );
                  }
                  return CarouselSlider.builder(
                    itemCount: cubit.popularList.length,
                    options: CarouselOptions(
                      height:270.h,
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

              BlocConsumer<UpComingCubit, UpComingStates>(
                builder: (context, state) {
                  var cubit = UpComingCubit.get(context);
                  if (cubit.upComingList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ),
                    );
                  }
          
                  return NewReleases(
                    movie: cubit.upComingList,
                  );
                },
                listener: (context, state) {},
              ),
              BlocConsumer<RecommendedCubit, RecommendedStates>(
                builder: (context, state) {
                  var cubit = RecommendedCubit.get(context);
                  if (cubit.recommendedList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ),
                    );
                  }
                  return TopRatedWidget(
                    movie: cubit.recommendedList,
                  );
                },
                listener: (context, state) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
