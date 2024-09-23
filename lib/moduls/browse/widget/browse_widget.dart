import 'package:flutter/material.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/moduls/browse/widget/browse_list.dart';

class BrowseWidget extends StatelessWidget {
  Genres genres;

  BrowseWidget({required this.genres, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrowseList(
              genres,
            ),
          ),
        );
      },
      child: Container(
        width: 160.0,
        height: 90.0,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/image_cat.png'),
            ),
            Text(
              genres.name ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
