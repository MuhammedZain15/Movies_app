import 'package:flutter/material.dart';
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
            Container(
              child: Stack(
                children: [
                  Image.network(
                      "https://image.tmdb.org/t/p/w500/${movie.backDropImage}"),
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
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.06,
              child: Row(
                children: [
                  PopularItem(
                    movie: movie,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                       movie.movieTitle,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.releaseDate,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(181, 180, 180, 1.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
