import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/utils/app_constants.dart';
import 'package:project_setup_flutter_getx/views/movie/movie_controller.dart';
import 'package:project_setup_flutter_getx/views/movie/widgets/movie_list_item.dart';

import '../../widgets/shimmer_list.dart';

class MovieListView extends GetView<MovieController> {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.discoverMoviesTxt),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            getMovieList(context),
          ],
        ),
      ),
    );
  }

  //List Widget
  Widget getMovieList(BuildContext context) {
    return controller.obx(
      (state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.movieList.length,
          itemBuilder: (
            context,
            index,
          ) {
            return MovieListItem(
              data: controller.movieList[index],
            ).paddingOnly(bottom: 12);
          },
        );
      },
      onError: (msg) {
        print("Error $msg");
        return SizedBox();
      },
      onLoading: MyContactShimmer(),
    );
  }
}
