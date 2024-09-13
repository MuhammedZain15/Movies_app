import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/pages/item_photo_widget.dart';

class NewReleasesItem extends StatelessWidget {
  const NewReleasesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const ItemPhotoWidget(),
    );
  }
}
