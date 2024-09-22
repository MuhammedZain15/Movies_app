import 'package:flutter/material.dart';

import '../../pages/item_photo_widget.dart';


class MoreMoviesItem extends StatelessWidget {
  const MoreMoviesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 175,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color.fromRGBO(52, 53, 52, 1.0),
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ItemPhotoWidget(),
            ],
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.grade,
                      size: 18,
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "7.7",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  "Movie name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "2017",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
