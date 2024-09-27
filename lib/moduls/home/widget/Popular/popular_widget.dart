import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/moduls/home/widget/Popular/Popular_item.dart';

import '../../../../models/popular/popular_movies_model.dart';

class PopularWidget extends StatelessWidget {
  final MoviesModel movie;

  const PopularWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                "https://image.tmdb.org/t/p/w500/${movie.backDropImage}",

                key: UniqueKey(),
                placeholder: (context, url) {
                  return CircularProgressIndicator(
                    color: Color(0xFFFFB224),
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
                top: size.height * 0.09,
                child: const Icon(
                  Icons.play_circle_filled,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            left: size.width * 0.02,
            top: size.height * 0.12,
            child: Row(
              children: [
                PopularItem(
                  movie: movie,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      movie.movieTitle,
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      movie.releaseDate,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Color(0xFFB5B4B4),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
