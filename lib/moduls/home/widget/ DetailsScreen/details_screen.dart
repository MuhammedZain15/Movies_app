import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/moduls/home/details_manager/cubit.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/more_movies_widget.dart';
import 'package:movies_app/services/config/constants.dart';

import '../../details_manager/states.dart';
import 'category_container.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details_screen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var id = ModalRoute.of(context)?.settings.arguments as int;
    log(id.toString());
    return BlocProvider(
      create: (BuildContext context) => DetailsCubit()
        ..getDetails(id)
        ..getMoreLikeThis(id),
      child: BlocConsumer<DetailsCubit, DetailsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          if (state is LoadingsStates) {
            return CircularProgressIndicator(
              color: theme.primaryColor,
            );
          } else {
            var cubit = DetailsCubit.get(context);
            if (cubit.movieDetails != null) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    cubit.movieDetails!.movieTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: theme.primaryColor,
                ),
                body: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.22,
                      child: Stack(
                        children: [
                          Image.network(
                            "${Constants.link}${cubit.movieDetails?.backDropImage}",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            left: size.width * 0.40,
                            top: size.height * 0.08,
                            child: const Icon(
                              Icons.play_circle_filled,
                              size: 70,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            cubit.movieDetails!.movieTitle,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            cubit.movieDetails!.releaseDate,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(181, 180, 180, 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  "${Constants.link}${cubit.movieDetails!.posterImage}",
                                  fit: BoxFit.fill,
                                  width: size.width - size.width * .7,
                                  height: 240,
                                ),
                              ),
                              Image.asset('assets/icons/ic_bookmark.png'),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 75,
                              width: size.width * .3,
                              child: GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                itemCount: cubit.movieDetails!.genreIds.length,
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        mainAxisExtent: 60),
                                itemBuilder: (BuildContext context, int index) {
                                  return CategoryContainer(
                                    category: cubit
                                        .movieDetails!.genreIds[index].name,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: size.width * .65,
                                child: Text(
                                  cubit.movieDetails!.overview,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFBB3B),
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    cubit.movieDetails!.rating
                                        .toString()
                                        .substring(0, 3),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Builder(builder: (context) {
                      return MoreMoviesWidget(
                        movie: cubit.movies,
                      );
                    }),
                  ],
                ),
              );
            }
            else{
              return  CircularProgressIndicator(
                color: theme.primaryColor,
              );
            }
          }
        },
      ),
    );
  }
}
