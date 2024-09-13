import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/moduls/browse/pages/browse_page.dart';
import 'package:movies_app/moduls/home/pages/home_page.dart';
import 'package:movies_app/moduls/search/pages/search_page.dart';
import 'package:movies_app/moduls/watchlist/pages/watch_list_page.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  static const String routeName = 'layout';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    const BrowsePage(),
    const WatchListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Theme(

      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromRGBO(26, 26, 26, 1.0),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {

          });

        },
        items: const [
          BottomNavigationBarItem(
            icon: /*Image.asset("assets/icons/home-icon.png"),*/Icon(Icons.home),
            label: 'Home',
          ), BottomNavigationBarItem(
            icon: /*Image.asset("assets/icons/icon-search.png"),*/Icon(Icons.search),
            label: 'Search',
          ), BottomNavigationBarItem(
            icon: /*Image.asset("assets/icons/Icon-browse.png"),*/Icon(Icons.movie),
            label: 'Browse',
          ), BottomNavigationBarItem(
            icon: /*Image.asset("assets/icons/Icon-bookmark.png"),*/Icon(CupertinoIcons.square_favorites),
            label: 'Watchlist',
          ),
        ],
      ),
    ));
  }
}
