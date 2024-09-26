import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/moduls/home/widget/Recomended/top_rated_item.dart';

import '../../../../models/popular/popular_movies_model.dart';

class TopRatedWidget extends StatelessWidget {
  final List<MoviesModel> movie;

  const TopRatedWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 250.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
      color: Color(0xFF282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Recommended',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
           SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => TopRatedItem(
                movie: movie[index],
              ),
              itemCount: movie.length,
            ),
          ),
        ],
      ),
    );
  }
}
