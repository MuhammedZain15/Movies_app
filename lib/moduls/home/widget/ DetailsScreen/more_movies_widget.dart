import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/popular/popular_movies_model.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/more_movies_item.dart';

class MoreMoviesWidget extends StatelessWidget {
  final List<MoviesModel> movie;

  const MoreMoviesWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      color: const Color.fromRGBO(40, 42, 40, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'More Like This',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => MoreMoviesItem(
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
