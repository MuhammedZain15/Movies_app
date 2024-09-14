import 'package:flutter/material.dart';
import 'package:movies_app/moduls/watchlist/widget/watch_list_item.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Watchlist',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => const WatchListItem(),
                    separatorBuilder: (context, index) => Container(
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
                    itemCount: 2),
              )
            ],
          )),
    );
  }
}
