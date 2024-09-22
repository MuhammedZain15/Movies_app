import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/widget/New%20Releases/new_relase_Item.dart';

import '../../../../models/popular/popular_movies_model.dart';

class NewReleases extends StatelessWidget {
  final List<MoviesModel> movie;

  const NewReleases({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: const Color(0xFF282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Releases ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => NewReleasesItem(
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
