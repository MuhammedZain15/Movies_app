import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 300,
      child: Stack(
        children: [
          InkWell(
            onTap: () {

            },
            child: Image.asset(
              "assets/images/item_image.png",
              fit: BoxFit.cover,
              width: 130,
              height: 200,
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset('assets/icons/ic_bookmark.png'),
            ),
          ),
        ],
      )

    );
  }
}
