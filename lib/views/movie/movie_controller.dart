import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/controller/base_controller.dart';

import '../../model/movie_data.dart';
import '../../services/index.dart';

class MovieController extends BaseController with StateMixin {
  Services _services = Services();
  final movieList = RxList<MovieData>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    callMovieListApi();
  }

  void callMovieListApi() async {
    change(movieList, status: RxStatus.loading());
    final response = await _services.api!.getPopularMovies();
    if (response != null) {
      movieList.addAll(response.results ??[]);
    }
    change(movieList, status: RxStatus.success());
  }
}
