import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/data/data_sources/movie_remotedata.dart';
import 'package:moviedb_project/data/models/moviegetresponse.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  ControllerBloc() : super(Initialstate()) {
    on<GetNowplayingMovielist>((event, emit) async {
      final MovieDataImpt movie = MovieDataImpt();
      print('bloc started');
     
      emit(
        ControllerState(
            isloading: true,
            nowplayingmovielist: [],
            upcominglist: [],
            latestmovielist: []),
      );

      final movienowplaying = await movie.getNowplayingMovielist();
      final upcominglist = await movie.getupcomingMovielist();
      final latestlist = await movie.getLatestMovielist();

      emit(ControllerState(
        isloading: false,
        nowplayingmovielist: movienowplaying,
        latestmovielist: latestlist.sublist(0, 15),
        upcominglist: upcominglist,
      ));
    });
  }
}
