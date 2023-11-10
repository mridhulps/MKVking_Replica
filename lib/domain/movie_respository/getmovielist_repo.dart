import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';
import 'package:moviedb_project/domain/models/usemodel/usemodel.dart';

abstract class MovieListRepo {
  Future<List<MovieResponseModel>> getNowplayingMovielist();
  Future<List<MovieResponseModel>> getUpcomingplayingMovielist();
  Future<List<MovieResponseModel>> getLatestplayingMovielist();
}
