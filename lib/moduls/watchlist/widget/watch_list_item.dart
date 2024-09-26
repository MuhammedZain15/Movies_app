import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';

class WatchListItem extends StatelessWidget {
  int MovieId;

  WatchListItem({
    required this.MovieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: ApiManager.fetchDetails(MovieId),

      builder: (context, snapshot) => Container(

        margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
        width: double.infinity,
        height: 100.h,
        child: Row(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${snapshot.data?.backDropImage}",
                      fit: BoxFit.cover,
                      width: 150.w,
                      height: 100.h,
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
                      color: Color.fromRGBO(181, 180, 180, 1.0),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    snapshot.data?.overview ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
