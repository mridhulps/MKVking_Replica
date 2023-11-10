import 'package:moviedb_project/data/core/api_constants.dart';
import 'package:moviedb_project/domain/api_Client/api_client.dart';
import 'package:moviedb_project/domain/jsonconverter_toModel/jsonconverter.dart';
import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';

import 'package:moviedb_project/domain/movie_respository/getmovielist_repo.dart';

class MovieRepoImp implements MovieListRepo {
  Api_ClientImp clientfetch = Api_ClientImp();

  @override
  Future<List<MovieResponseModel>> getLatestplayingMovielist() async {
    final movie = await clientfetch.getMovieResult(ApiConstantsUrls.nowplaying);

    final model = JsonConverterToModle.fromjson(json: movie).movielist;

    return model;
  }

  @override
  Future<List<MovieResponseModel>> getNowplayingMovielist() async {
    final movie = await clientfetch.getMovieResult(ApiConstantsUrls.nowplaying);
    final model = JsonConverterToModle.fromjson(json: movie).movielist;

    return model;
  }

  @override
  Future<List<MovieResponseModel>> getUpcomingplayingMovielist() async {
    final movie = await clientfetch.getMovieResult(ApiConstantsUrls.nowplaying);
    final model = JsonConverterToModle.fromjson(json: movie).movielist;

    return model;
  }
}
