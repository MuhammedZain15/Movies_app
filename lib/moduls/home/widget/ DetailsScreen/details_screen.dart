import 'package:flutter/material.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/more_movies_widget.dart';
import 'package:movies_app/services/theme/application_theme_manger.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details_screen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ApplicationThemeManger.primaryColor,
          title: const Text("Dora and the lost city of gold"),
          titleTextStyle: TextStyle(
            color: Colors.white
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.22,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/Image.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: size.width * 0.40,
                      top: size.height * 0.08,
                      child: const Icon(
                        Icons.play_circle_filled,
                        size: 70,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      // PopularItem(movies),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 190,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 130,
                      height: 300,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {},
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
                              child:
                                  Image.asset('assets/icons/ic_bookmark.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Action',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "dajhdkahda",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '7.7',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
              MoreMoviesWidget(),
            ],
          ),
        ));
  }
}
