import 'package:flutter/material.dart';
import 'package:movies_app/models/popular/popular_movies_model.dart';

import '../../../../services/config/constants.dart';
import '../../pages/item_photo_widget.dart';


class MoreMoviesItem extends StatelessWidget {
  final MoviesModel movie;

  const MoreMoviesItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 175,
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
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    "${Constants.link}${movie.posterImage}",
                    fit: BoxFit.cover,
                    width: 110,
                    height: 130,
                  ),
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
          Container(
            margin: EdgeInsets.all(6),
            child: Column(
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
