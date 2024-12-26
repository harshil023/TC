import 'package:project_setup_flutter_getx/model/login_master.dart';
import 'package:project_setup_flutter_getx/model/user_list_master.dart';

import '../model/movie_list_data.dart';

abstract class BaseServices {
  Future<LoginMaster?> login({required body, onNoInternet, onError});

  Future<UserListMaster?> userList({pageNumber, onNoInternet, onError});

  Future<MoviesListData?> getPopularMovies();
}
