import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../home/widget/ DetailsScreen/details_screen.dart';

class ResultItem extends StatefulWidget {
  final String path;
  final int id;

  const ResultItem({super.key, required this.path, required this.id});

  @override
  State<ResultItem> createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {
  bool isChecked = false;
  late Box favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box('favoritesBox');
    isChecked = favoritesBox.containsKey(widget.id);
  }

  void _toggleFavorite() {
    setState(() {
      isChecked = !isChecked;
      if (isChecked) {
        favoritesBox.put(widget.id,widget.id);
      } else {
        favoritesBox.delete(widget.id);
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
                  arguments: widget.id,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/${widget.path}',
              fit: BoxFit.cover,
              width: 150,
              height: 100,
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
        ),
        InkWell(
          onTap: () => _toggleFavorite(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              isChecked
                  ? "assets/icons/is_check.png"
                  : 'assets/icons/ic_bookmark.png',
            ),
          ),
        ),
      ],
    );
  }
}
