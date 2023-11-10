part of 'controller_bloc.dart';

class ControllerState {
  ControllerState({
    required this.isloading,
    required this.nowplayingmovielist,
    required this.latestmovielist,
    required this.upcominglist,
  });

  bool? isloading;

  List<MovieResponseModel> nowplayingmovielist = [];

  List<MovieResponseModel> upcominglist = [];
  List<MovieResponseModel> latestmovielist = [];
}

class Initialstate extends ControllerState {
  Initialstate()
      : super(
            isloading: false,
            nowplayingmovielist: [],
            latestmovielist: [],
            upcominglist: []);
}
