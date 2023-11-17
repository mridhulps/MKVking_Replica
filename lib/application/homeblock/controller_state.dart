part of 'controller_bloc.dart';

class ControllerState {
  bool? isloading;
  bool? upscrollcontainer;

  List<MovieResponseModel> nowplayingmovielist;

  List<MovieResponseModel> upcominglist;
  List<MovieResponseModel> latestmovielist;

  ControllerState({
    required this.isloading,
    required this.nowplayingmovielist,
    required this.latestmovielist,
    required this.upcominglist,
    this.upscrollcontainer = false,
  });

  ControllerState copywith({
    bool? isloadings,
    bool? upscrollcontainers,
    List<MovieResponseModel>? nowplayingmovielists,
    List<MovieResponseModel>? upcominglists,
    List<MovieResponseModel>? latestmovielists,
  }) {
    return ControllerState(
        isloading: isloadings,
        nowplayingmovielist: nowplayingmovielist,
        latestmovielist: latestmovielist,
        upcominglist: upcominglist,
        upscrollcontainer: upscrollcontainers);
  }
}

class Initialstate extends ControllerState {
  Initialstate()
      : super(
            isloading: false,
            nowplayingmovielist: [],
            latestmovielist: [],
            upcominglist: []);
}
