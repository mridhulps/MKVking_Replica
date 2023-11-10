import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/data/data_sources/movie_remotedata.dart';
import 'package:moviedb_project/domain/models/originmodel/originmodel.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  ControllerBloc() : super(Initialstate()) {
    MovieDataImpt datasource = MovieDataImpt();
    on<GetNowplayingMovielist>(
        (event, emit) => getMovielist(event, emit, datasource));
  }
}

Future<void> getMovielist(GetNowplayingMovielist event,
    Emitter<ControllerState> emit, MovieDataImpt datasource) async {
  final state = ControllerState(
      isloading: true,
      nowplayingmovielist: [],
      upcominglist: [],
      latestmovielist: []);

  emit(state);

  final nowplayinglist = await datasource.getNowplayingMovielist();
  final latestplayinglist = await datasource.getNowplayingMovielist();
  final upcominglist = await datasource.getNowplayingMovielist();

  final currentstate = ControllerState(
      isloading: false,
      nowplayingmovielist: nowplayinglist,
      latestmovielist: latestplayinglist,
      upcominglist: upcominglist);
  emit(currentstate);
}
