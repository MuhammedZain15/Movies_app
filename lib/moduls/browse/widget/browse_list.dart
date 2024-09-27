import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/search_model.dart';
import 'package:movies_app/moduls/browse/widget/result_item.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';
import 'package:movies_app/services/theme/application_theme_manger.dart';

class BrowseList extends StatelessWidget {
  Genres? genresResponse;

  /*static const String routeName = 'BrowseList';*/
  BrowseList(this.genresResponse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ApplicationThemeManger.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          '${genresResponse!.name} List',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<Movies>(
                future:
                    ApiManager.fetchMoviesList(genresResponse!.id!.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'error => ${snapshot.error}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                    );
                  }

                  return ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 10, right: 8, left: 8),
                        width: double.infinity,
                        height: 100.h,
                        child: Row(
                          children: [
                            ResultItem(
                              path: snapshot.data?.results!
                                      .elementAt(index)
                                      .posterPath ??
                                  "",
                              id: snapshot.data!.results!.elementAt(index).id!,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data?.results
                                            ?.elementAt(index)
                                            .title ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:  TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    snapshot.data?.results
                                            ?.elementAt(index)
                                            .releaseDate ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:  TextStyle(
                                      fontSize: 13.sp,
                                      color: Color.fromRGBO(181, 180, 180, 1.0),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    snapshot.data?.results
                                            ?.elementAt(index)
                                            .overview ??
                                        "",
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
                      );
                    },
                    separatorBuilder: (buildContext, index) => Container(
                      margin: const EdgeInsets.only(
                        left: 2,
                        right: 2,
                        top: 18,
                        bottom: 18,
                      ),
                      width: double.infinity,
                      height: 1.h,
                      color: Colors.grey,
                    ),
                    itemCount: snapshot.data!.results!.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

