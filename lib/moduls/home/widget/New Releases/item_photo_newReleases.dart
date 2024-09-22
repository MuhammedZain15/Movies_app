import 'package:flutter/material.dart';

import '../../../../models/popular/popular_movies_model.dart';

class ItemPhotoNewReleases extends StatelessWidget {
  final MoviesModel movie;

  const ItemPhotoNewReleases({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.posterImage}',
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
    );
  }
}
