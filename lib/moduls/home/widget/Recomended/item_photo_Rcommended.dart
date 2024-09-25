import 'package:flutter/material.dart';

import '../ DetailsScreen/details_screen.dart';
import '../../../../models/popular/popular_movies_model.dart';

class ItemPhotoRecommended extends StatefulWidget {
  final MoviesModel movie;

  const ItemPhotoRecommended({super.key, required this.movie});

  @override
  State<ItemPhotoRecommended> createState() => _ItemPhotoRecommendedState();
}

class _ItemPhotoRecommendedState extends State<ItemPhotoRecommended> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              'https://image.tmdb.org/t/p/w500/${widget.movie.posterImage}',
              fit: BoxFit.cover,
              width: 110,
              height: 130,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isClicked =!isClicked;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              isClicked? "assets/icons/is_check.png":'assets/icons/ic_bookmark.png',
            ),
          ),
        ),
      ],
    );
  }
}
