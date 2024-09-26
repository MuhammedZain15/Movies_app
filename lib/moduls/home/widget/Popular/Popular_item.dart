import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';

import '../../../../models/popular/popular_movies_model.dart';

class PopularItem extends StatefulWidget {
  final MoviesModel movie;

  const PopularItem({super.key, required this.movie});

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool isChecked =false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      height: 250.h,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                  settings: RouteSettings(
                    arguments: widget.movie.movieId,
                  ),
                ),
              );
            },
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/${widget.movie.posterImage}",
              fit: BoxFit.cover,
              width: 130.w,
              height: 175.h,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isChecked =!isChecked;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:!isChecked? Image.asset('assets/icons/ic_bookmark.png'):Image.asset("assets/icons/is_check.png"),
            ),
          ),
        ],
      ),
    );
  }
}
