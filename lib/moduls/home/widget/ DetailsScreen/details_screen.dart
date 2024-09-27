import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/moduls/home/details_manager/cubit.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/item_photo.dart';
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
                    style:  TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: theme.primaryColor,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.21,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              "${Constants.link}${cubit.movieDetails?.backDropImage}",
                              fit: BoxFit.cover,
                              width: double.infinity,

                              key: UniqueKey(),
                              placeholder: (context, url) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFFFB224),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                size: 35,
                                color: Colors.red,
                              ),
                            ),
                            Positioned(
                              left: size.width * 0.40,
                              top: size.height * 0.08,
                              child:  Icon(
                                Icons.play_circle_filled,
                                size: 70.sp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .94,
                              child: Text(
                                cubit.movieDetails!.movieTitle,
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                                style:  TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
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
                                fontSize: 13.sp,
                                color: Color.fromRGBO(181, 180, 180, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: ItemPhoto(movie: cubit.movieDetails!,),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 75.h,
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
                                          crossAxisSpacing:1,
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
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  width: size.width * .64,
                                  child: Text(
                                    cubit.movieDetails!.overview,
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: Row(
                                  children: [
                                     Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFFFFBB3B),
                                      size: 30.sp,
                                    ),
                                     SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      cubit.movieDetails!.rating
                                          .toString()
                                          .substring(0, 3),
                                      style:  TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      MoreMoviesWidget(
                        movie: cubit.movies,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
