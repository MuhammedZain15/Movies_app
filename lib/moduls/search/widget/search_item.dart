import 'package:flutter/material.dart';
import 'package:movies_app/models/search_model.dart';
import 'package:movies_app/moduls/home/widget/%20DetailsScreen/details_screen.dart';

class SearchItem extends StatefulWidget {
  Results? movieResponse;
  int index;

  SearchItem(this.movieResponse, this.index, {super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  bool isClicked =false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Flexible(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DetailsScreen(),
                          settings: RouteSettings(arguments: widget.movieResponse?.id)
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.movieResponse!
                          .posterPath}',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 100,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isClicked=!isClicked;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child:Image.asset(
                      isClicked? "assets/icons/is_check.png":'assets/icons/ic_bookmark.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.movieResponse!.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.movieResponse!.releaseDate ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                const SizedBox(height: 5),
                 Text(
                  widget.movieResponse!.overview!,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
