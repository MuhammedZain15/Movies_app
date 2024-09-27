import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/main.dart';

import '../ DetailsScreen/details_screen.dart';
import '../../../../models/popular/popular_movies_model.dart';

class ItemPhotoRecommended extends StatefulWidget {
  final MoviesModel movie;

  const ItemPhotoRecommended({super.key, required this.movie});

  @override
  State<ItemPhotoRecommended> createState() => _ItemPhotoRecommendedState();
}

class _ItemPhotoRecommendedState extends State<ItemPhotoRecommended> {
  bool isChecked = false;
  late Box favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box('favoritesBox');
    isChecked = favoritesBox.containsKey(widget.movie.movieId);
  }

  void _toggleFavorite() {
    setState(() {
      isChecked = !isChecked;
      if (isChecked) {
        favoritesBox.put(widget.movie.movieId, widget.movie.movieId);
      } else {
        favoritesBox.delete(widget.movie.movieId);
      }
    });
  }

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
            child:  CachedNetworkImage(
              imageUrl:
              "https://image.tmdb.org/t/p/w500/${widget.movie.posterImage}",

              key: UniqueKey(),
              placeholder: (context, url) {
                return const Center(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFFB224),
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () =>
           _toggleFavorite()
          ,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              isChecked? "assets/icons/is_check.png":'assets/icons/ic_bookmark.png',
            ),
          ),
        ),
      ],
    );
  }
}
