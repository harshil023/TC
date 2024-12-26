import 'dart:convert';

import 'package:project_setup_flutter_getx/model/user_list_master.dart';
import 'package:project_setup_flutter_getx/services/network_service.dart';
import 'package:project_setup_flutter_getx/utils/api_request_type.dart';
import 'package:project_setup_flutter_getx/utils/app_constants.dart';

import '../model/login_master.dart';
import '../model/movie_list_data.dart';
import '../utils/utility.dart';
import 'base_services.dart';

class ApiServices extends BaseServices {
  NetworkService? networkService;

  ApiServices() {
    printf("Network constructor");
    networkService = new NetworkService();
  }

  @override
  Future<LoginMaster?> login({required body, onNoInternet, onError}) async {
    try {
      Uri uri = Uri.parse(AppConstants.login);
      var response = await networkService?.callRequest(
          uri: uri,
          params: body,
          bearerToken: "176957e9-a600-4ed3-a973-33684dcd310b",
          requestType: ApiRequestType.REQUEST_POST,
          onError: onError,
          onNoInternet: onNoInternet);

      return response != null
          ? LoginMaster.fromJson(json.decode(response.body))
          : null;
    } catch (err, log) {
      printf("Error: " + err.toString() + "\n Log" + log.toString());
      return null;
    }
  }

  @override
  Future<UserListMaster?> userList({pageNumber, onNoInternet, onError}) async {
    try {
      Uri uri = Uri.parse(AppConstants.userList + "?page=$pageNumber");
      var response = await networkService?.callRequest(
          uri: uri,
          bearerToken: "176957e9-a600-4ed3-a973-33684dcd310b",
          requestType: ApiRequestType.REQUEST_GET,
          onNoInternet: onNoInternet,
          onError: onError);

      return response != null
          ? UserListMaster.fromJson(json.decode(response.body))
          : null;
    } catch (err, log) {
      printf("Error: " + err.toString() + "\n Log" + log.toString());
      return null;
    }
  }

  @override
  Future<MoviesListData?> getPopularMovies() async {
    try {
      Uri uri =
          Uri.parse(AppConstants.movieDbBaseUrl + AppConstants.discoverMoviesUrl);
      var response = await networkService?.callRequest(
        uri: uri,
        bearerToken: AppConstants.movieDbBearerToken,
        requestType: ApiRequestType.REQUEST_GET,
      );
      return response != null ? MoviesListData.fromJson(json.decode(response.body)) : null;
    } catch (err, log) {
      printf("Error: " + err.toString() + "\n Log" + log.toString());
      return null;
    }
  }
}
