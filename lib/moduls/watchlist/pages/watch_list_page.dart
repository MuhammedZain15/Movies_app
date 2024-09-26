import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/moduls/watchlist/widget/watch_list_item.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Box favoritesBox = Hive.box('favoritesBox');

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Watchlist',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: favoritesBox.length,
                itemBuilder: (context, index) {
                  final movieId = favoritesBox.getAt(index);

                  return WatchListItem(
                    MovieId:movieId ,
                  );
                },
                separatorBuilder: (context, index) =>
                    Container(
                      margin: const EdgeInsets.only(
                        left: 2,
                        right: 2,
                        top: 20,
                        bottom: 10,
                      ),
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
