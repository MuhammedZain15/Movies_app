import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/pages/item_photo_widget.dart';

import '../../../../models/popular/popular_movies_model.dart';
import 'item_photo_newReleases.dart';

class NewReleasesItem extends StatelessWidget {
  final MoviesModel movie;
  const NewReleasesItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ItemPhotoNewReleases(
        movie: movie,
      ),
    );
  }
}
