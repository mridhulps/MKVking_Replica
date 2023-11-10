import 'package:moviedb_project/data/models/moviegetresponse.dart';

class PageList {
  int? page;
  List<MovieResponseModel>? results;
  int? totalPages;
  int? totalResults;

  PageList({this.page, this.results, this.totalPages, this.totalResults});

  PageList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieResponseModel>[];
      json['results'].forEach((v) {
        results!.add(MovieResponseModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
