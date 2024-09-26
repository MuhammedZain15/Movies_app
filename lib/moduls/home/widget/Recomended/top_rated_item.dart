import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/popular/popular_movies_model.dart';
import 'item_photo_Rcommended.dart';

class TopRatedItem extends StatelessWidget {
  final MoviesModel movie;

  const TopRatedItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 188.h,
      margin:  EdgeInsets.symmetric(horizontal: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.sp),
        color: const Color(0xff343534),
        boxShadow: [
          const BoxShadow(color: Colors.black45, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ItemPhotoRecommended(
                movie: movie,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(6),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.grade,
                      size: 18.sp,
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      movie.rating.toString().substring(0,3),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  movie.movieTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),

                Text(
                  movie.releaseDate,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
