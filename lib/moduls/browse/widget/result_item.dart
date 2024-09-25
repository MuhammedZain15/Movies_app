import 'package:flutter/material.dart';

import '../../home/widget/ DetailsScreen/details_screen.dart';

class ResultItem extends StatefulWidget {
  final String path;
  final int id;
  const ResultItem({super.key, required this.path, required this.id});

  @override
  State<ResultItem> createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {
  bool isClicked= false;
  @override
  Widget build(BuildContext context) {
    return  Stack(
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
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${widget.path}',
              fit: BoxFit.cover,
              width: 150,
              height: 100,
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
