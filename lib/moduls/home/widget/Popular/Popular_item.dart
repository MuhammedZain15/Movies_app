import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';
import '../../../../models/popular/popular_movies_model.dart';

class PopularItem extends StatefulWidget {
  final MoviesModel movie;

  const PopularItem({super.key, required this.movie});

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
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
    return SizedBox(
      width: 130.w,
      height: 250.h,
      child: Stack(
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
            child:  CachedNetworkImage(
              imageUrl:
              "https://image.tmdb.org/t/p/w500/${widget.movie.posterImage}",

              key: UniqueKey(),
              placeholder: (context, url) {
                return CircularProgressIndicator(
                  color: Color(0xFFFFB224),
                );
              },
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: _toggleFavorite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: !isChecked
                  ? Image.asset('assets/icons/ic_bookmark.png')
                  : Image.asset("assets/icons/is_check.png"),
            ),
          ),
        ],
      ),
    );
  }
}
