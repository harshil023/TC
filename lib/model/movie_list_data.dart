import 'movie_data.dart';

class MoviesListData {
  int? page;
  List<MovieData>? results;
  int? totalPages;
  int? totalResults;

  MoviesListData({page, totalResults, totalPages, results});

  MoviesListData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <MovieData>[];
      json['results'].forEach((v) {
        results?.add(MovieData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['page'] = page;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}