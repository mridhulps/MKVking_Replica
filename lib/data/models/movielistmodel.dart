import 'dart:developer';

import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';

class Jsonmodel {
  List<MovieResponseModel>? movielist;

  Jsonmodel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movielist = <MovieResponseModel>[];

      json['results'].forEach((v) {
        movielist!.add(MovieResponseModel.fromJson(v));
      });
    } else {
      log('jsonmodelparsing list is empty');
      [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (movielist != null) {
      data['results'] = movielist!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
