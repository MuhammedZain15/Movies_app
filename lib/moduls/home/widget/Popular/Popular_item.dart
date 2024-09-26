import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';

import '../../../../models/popular/popular_movies_model.dart';

class PopularItem extends StatelessWidget {
  final MoviesModel movie;

  const PopularItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 300.h,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                  settings: RouteSettings(
                    arguments: movie.movieId,
                  ),
                ),
              );
            },
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/${movie.posterImage}",
              fit: BoxFit.cover,
              width: 130.w,
              height: 200.h,
            ),
          ),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset('assets/icons/ic_bookmark.png'),
            ),
          ),
        ],
      ),
    );
  }
}
