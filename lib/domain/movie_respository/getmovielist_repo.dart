import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';


abstract class MovieListRepo {
  Future<List<MovieResponseModel>> getNowplayingMovielist();
  Future<List<MovieResponseModel>> getUpcomingplayingMovielist();
  Future<List<MovieResponseModel>> getLatestplayingMovielist();
}
