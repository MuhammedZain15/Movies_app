import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';

import '../../home/widget/ DetailsScreen/details_screen.dart';

class WatchListItem extends StatefulWidget {
  int MovieId;

  WatchListItem({
    required this.MovieId,
    super.key,
  });

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  late Box favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box('favoritesBox');
  }

  void _toggleFavorite() {
    favoritesBox.delete(widget.MovieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder(

      future: ApiManager.fetchDetails(widget.MovieId),
      builder: (context, snapshot) => Slidable(
        direction: Axis.horizontal,
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              onPressed: (BuildContext context) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: theme.primaryColor,
                    title: const Text(
                      "Are you sure ?",
                      style: TextStyle(
                        color: Color(0xFFFFB224),
                      ),
                    ),
                    content: const Text(
                      "You will not be able to retrieve it",
                      style: TextStyle(
                        color: Color(0xFFFFB224),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xFFFFB224),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _toggleFavorite();
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
          width: double.infinity,
          height: 100.h,
          child: Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: widget.MovieId,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500/${snapshot.data?.backDropImage}",
                        width: 150.w,
                        height: 100.w,
                        key: UniqueKey(),
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFFFB224),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data?.movieTitle ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      snapshot.data?.releaseDate ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      snapshot.data?.overview ?? "",
                      maxLines: 1,
                      textWidthBasis: TextWidthBasis.longestLine,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
