import 'package:flutter/material.dart';

class ItemPhotoWidget extends StatelessWidget {
  const ItemPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              "assets/images/test.png",
              fit: BoxFit.cover,
              width: 110,
              height: 130,
            ),
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
    );
  }
}
