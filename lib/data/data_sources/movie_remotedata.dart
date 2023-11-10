import 'dart:developer';

import 'package:moviedb_project/data/core/api_cliant.dart';
import 'package:moviedb_project/data/core/api_constants.dart';
import 'package:moviedb_project/data/models/moviegetresponse.dart';


import '../models/movielistmodel.dart';

abstract class MovieDataSource {
  Future<List<MovieResponseModel>> getNowplayingMovielist();
  Future<List<MovieResponseModel>> getupcomingMovielist();
  Future<List<MovieResponseModel>> getLatestMovielist();

}

class MovieDataImpt extends MovieDataSource {
  final Api_Fetch cliant = Api_Fetch();
  List<List<MovieResponseModel>> pagelist = [];

  @override
  Future<List<MovieResponseModel>> getNowplayingMovielist() async {
    final movie = await cliant.get(ApiConstantsUrls.nowplaying);

    final model = Jsonmodel.fromJson(movie).movielist;

    if (model == null) {
      log('now playing list is null');
    }

    return model!;
  }

  @override
  Future<List<MovieResponseModel>> getupcomingMovielist() async {
    final movie = await cliant.get(ApiConstantsUrls.upcomingplaying);
    final model = Jsonmodel.fromJson(movie).movielist;

    if (model == null) {
      log('upcoming movie list is null');
    }

    return model ?? [];
  }

  @override
  Future<List<MovieResponseModel>> getLatestMovielist() async {
    final movie = await cliant.get(ApiConstantsUrls.latestplaying);
    final model = Jsonmodel.fromJson(movie).movielist;

    if (model == null) {
      log('latest movie list is null');
    }

    return model!;
  }

  
}
