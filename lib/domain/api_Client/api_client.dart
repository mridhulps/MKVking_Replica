// ignore_for_file: file_names, camel_case_types

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:moviedb_project/data/core/api_constants.dart';

class Api_ClientImp {
  final client = http.Client();

  Future<Map<String, dynamic>> getMovieResulttotalMap(String uri) async {
    final response = await client.get(Uri.parse(
        '${ApiConstantsUrls.baseurl}/$uri=${ApiConstantsUrls.apiKey}'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final movieobj = jsonDecode(response.body) as Map<String, dynamic>;

      return movieobj;
    } else {
      log('httpclientError');
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> searchgetlisttotlaMap(String name) async {
    final response = await client.get(Uri.parse(
        '${ApiConstantsUrls.baseurl}/search/movie?query=$name&api_key=${ApiConstantsUrls.apiKey}'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final movie = jsonDecode(response.body) as Map<String, dynamic>;

      return movie;
    } else {
      log('API_CLIANT ERROR');

      throw Exception(response.reasonPhrase);
    }
  }
}
