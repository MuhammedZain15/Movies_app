import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/models/details_model/details.dart';

import '../../../../services/config/constants.dart';

class ItemPhoto extends StatefulWidget {

  const ItemPhoto({super.key, required this.movie});

  final DetailsModel movie;

  @override
  State<ItemPhoto> createState() => _ItemPhotoState();
}

class _ItemPhotoState extends State<ItemPhoto> {
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
        favoritesBox.put(widget.movie.movieId,widget.movie.movieId);
      } else {
        favoritesBox.delete(widget.movie.movieId);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl:
            "${Constants.link}${widget.movie.posterImage}",
            fit: BoxFit.fill,
            width: size.width - size.width * .7,
            height: 170.h,

            key: UniqueKey(),
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFFB224),
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
        InkWell(
          onTap: () => _toggleFavorite(),
          child: Image.asset(
            isChecked
                ? "assets/icons/is_check.png"
                : 'assets/icons/ic_bookmark.png',
          ),
        ),
      ],
    );
  }
}
