import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';

import '../../../../models/popular/popular_movies_model.dart';

class PopularItem extends StatelessWidget {
  final MoviesModel movie;

  const PopularItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 300,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ));
              },
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/${movie.posterImage}",
                fit: BoxFit.cover,
                width: 130,
                height: 200,
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
        ));
  }
}
