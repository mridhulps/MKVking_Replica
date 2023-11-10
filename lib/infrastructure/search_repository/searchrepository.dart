

   import 'dart:developer';


import 'package:moviedb_project/domain/api_Client/api_client.dart';
import 'package:moviedb_project/domain/jsonconverter_toModel/jsonconverter.dart';

import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';

class SearchRepository {
  final Api_ClientImp cliant = Api_ClientImp();

  Future<List<MovieResponseModel>> getSearchresultdata(String name) async {
    try {
      final movie = await cliant.searchgetlisttotlaMap(name);

      final list = JsonConverterToModle.fromjson(json: movie).movielist;

      return list;
    } catch (e) {
      log(e.toString());
      throw Exception('search parsing error');
    }
  }
}
