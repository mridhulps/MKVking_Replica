part of 'controller_bloc.dart';

class ControllerState {
  ControllerState({
    required this.isloading,
    required this.nowplayingmovielist,
    required this.latestmovielist,
    required this.upcominglist,
  });

  bool? isloading;

  List<MovieResponseModel> nowplayingmovielist;

  List<MovieResponseModel> upcominglist;
  List<MovieResponseModel> latestmovielist;

  // ControllerState.copywith(
  //     {this.isloading,
  //     this.nowplayingmovielist,
  //     this.latestmovielist ,
  //     this.upcominglist }) {
  //   ControllerState(
  //       isloading: isloading,
  //       nowplayingmovielist: nowplayingmovielist,
  //       latestmovielist: latestmovielist,
  //       upcominglist: upcominglist);
  }


class Initialstate extends ControllerState {
  Initialstate()
      : super(
            isloading: false,
            nowplayingmovielist: [],
            latestmovielist: [],
            upcominglist: []);
}
