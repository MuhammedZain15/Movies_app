import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/popular/popular_movies_model.dart';
import '../../../../services/config/constants.dart';
import 'details_screen.dart';

class MoreMoviesItem extends StatefulWidget {
  final MoviesModel movie;

  const MoreMoviesItem({
    super.key,
    required this.movie,
  });

  @override
  State<MoreMoviesItem> createState() => _MoreMoviesItemState();
}

class _MoreMoviesItemState extends State<MoreMoviesItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color.fromRGBO(52, 53, 52, 1.0),
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
          Stack(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    "${Constants.link}${widget.movie.posterImage}",
                    fit: BoxFit.cover,
                    width: 110.w,
                    height: 130.h,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    isClicked
                        ? "assets/icons/is_check.png"
                        : 'assets/icons/ic_bookmark.png',
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: Column(
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
                      widget.movie.rating.toString().substring(0, 3),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  widget.movie.movieTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  widget.movie.releaseDate,
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
