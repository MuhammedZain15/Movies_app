import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/widget/Popular/Popular_item.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.30,
        margin: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset("assets/images/Image.png"),
                  Positioned(
                    left: size.width * 0.40,
                    top: size.height * 0.09,
                    child: const Icon(
                      Icons.play_circle_filled,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.06,
              child: const Row(
                children: [
                  PopularItem(),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Dora and the lost city of gold",
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "2019",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(181, 180, 180, 1.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
