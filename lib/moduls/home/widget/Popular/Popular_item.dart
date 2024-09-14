import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ));
              },
              child: Image.asset(
                "assets/images/item_image.png",
                fit: BoxFit.cover,
                width: 130,
                height: 200,
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
        ));
  }
}
