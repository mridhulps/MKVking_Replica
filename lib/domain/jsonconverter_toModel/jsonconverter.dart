import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';

class JsonConverterToModle {
  JsonConverterToModle.internal();

  static JsonConverterToModle instance = JsonConverterToModle.internal();

  factory JsonConverterToModle() {
    return instance;
  }

  final List<MovieResponseModel> movielist = [];

  JsonConverterToModle.fromjson({required Map<String, dynamic> json}) {
    json['results'].forEach((v) {
      return movielist.add(MovieResponseModel.fromJson(v));
    });
  }
}
