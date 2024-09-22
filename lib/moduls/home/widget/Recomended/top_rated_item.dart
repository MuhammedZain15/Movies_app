import 'package:flutter/material.dart';

import '../../../../models/popular/popular_movies_model.dart';
import 'item_photo_Rcommended.dart';

class TopRatedItem extends StatelessWidget {
  final MoviesModel movie;

  const TopRatedItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 188,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xff343534),
        boxShadow: [
          const BoxShadow(color: Colors.black45, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
          const Stack(
            children: [
              ItemPhotoRecommended(
                movie: movie,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(6),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.grade,
                      size: 18,
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                    SizedBox(width: 5),
                    Text(
                      movie.rating.toString().substring(0,3),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  movie.movieTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  movie.releaseDate,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 10,
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
