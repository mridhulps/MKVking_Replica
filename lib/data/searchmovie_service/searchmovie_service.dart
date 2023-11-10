import 'dart:developer';

import 'package:moviedb_project/data/core/api_cliant.dart';
import 'package:moviedb_project/data/models/moviegetresponse.dart';

import '../models/movielistmodel.dart';

// abstract class SearchMovieResult {
//   Future<List<MovieResponseModel>> getSearchresultdata(String name);
// }

class Searchlist {
  final Api_Fetch cliant = Api_Fetch();

  Future<List<MovieResponseModel>> getSearchresultdata(String name) async {
    try {
      final movie = await cliant.searchget(name);

      final list = Jsonmodel.fromJson(movie).movielist;

      if (list == null) {
        log('searchresultlist is empty');
      }

      return list!;
    } catch (e) {
      log(e.toString());
      throw Exception('search parsing error');
    }
  }
}
