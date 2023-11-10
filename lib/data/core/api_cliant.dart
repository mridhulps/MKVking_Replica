// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:moviedb_project/data/core/api_constants.dart';

class Api_Fetch {
  Api_Fetch();

  final cliant = http.Client();

  Future<dynamic> get(String uri) async {
    final response = await cliant.get(Uri.parse(
        '${ApiConstantsUrls.baseurl}/$uri=${ApiConstantsUrls.apiKey}'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final movie = jsonDecode(response.body) as Map<String, dynamic>;

      return movie;
    } else {
      log('API_CLIANT ERROR');

      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> searchget(String name) async {
    if (name.isEmpty) {
      log('search value is empty');
    } else {
      final response = await cliant.get(Uri.parse(
          '${ApiConstantsUrls.baseurl}/search/movie?query=$name&api_key=${ApiConstantsUrls.apiKey}'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final movie = jsonDecode(response.body) as Map<String, dynamic>;
        log('RESPONSE 200 >$movie');
        return movie;
      } else {
        log('API_CLIANT ERROR');

        throw Exception(response.reasonPhrase);
      }
    }
  }
}
