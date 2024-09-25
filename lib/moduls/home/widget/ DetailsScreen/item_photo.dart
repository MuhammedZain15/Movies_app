import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../services/config/constants.dart';

class ItemPhoto extends StatefulWidget {

  const ItemPhoto({super.key, required this.path});
  final String path;

  @override
  State<ItemPhoto> createState() => _ItemPhotoState();
}

class _ItemPhotoState extends State<ItemPhoto> {
  bool isClicked =false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            "${Constants.link}${widget.path}",
            fit: BoxFit.fill,
            width: size.width - size.width * .7,
            height: 240,
          ),
        ),
        InkWell(
          onTap: () => setState(() {
            isClicked = !isClicked;
          }),
          child: Image.asset(
            isClicked
                ? "assets/icons/is_check.png"
                : 'assets/icons/ic_bookmark.png',
          ),
        ),
      ],
    );
  }
}
