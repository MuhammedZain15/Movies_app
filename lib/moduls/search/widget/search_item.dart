import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/main.dart';
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
  bool isChecked = false;
  late Box favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box('favoritesBox');
    isChecked = favoritesBox.containsKey(widget.movieResponse?.id);
  }

  void _toggleFavorite() {
    setState(() {
      isChecked = !isChecked;
      if (isChecked) {
        favoritesBox.put(widget.movieResponse?.id, widget.movieResponse?.id);
      } else {
        favoritesBox.delete(widget.movieResponse?.id);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100.h,
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
                          settings: RouteSettings(
                              arguments: widget.movieResponse?.id)
                      ),
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl:
                        "https://image.tmdb.org/t/p/w500/${widget.movieResponse!
                            .posterPath}",
                        fit: BoxFit.cover,
                        width: 150.w,
                        height: 100.h,

                        key: UniqueKey(),
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFFFB224),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) =>
                        const Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ), 
                  ),
                ),
                InkWell(
                  onTap: ()=>_toggleFavorite(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      isChecked
                          ? "assets/icons/is_check.png"
                          : 'assets/icons/ic_bookmark.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
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
                SizedBox(height: 5.h),
                Text(
                  widget.movieResponse!.releaseDate ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  widget.movieResponse!.overview!,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13.sp,
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
