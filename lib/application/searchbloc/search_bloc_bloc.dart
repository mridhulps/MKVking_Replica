import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/data/models/moviegetresponse.dart';
import 'package:moviedb_project/data/searchmovie_service/searchmovie_service.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBlocBloc() : super(SearchBlocInitial()) {
    on<SearchingBar>((event, emit) {
      if (state.issearchbaropen == false) {
        emit(SearchBlocState(issearchbaropen: true, searchresultlist: []));
      } else {
        emit(SearchBlocState(issearchbaropen: false, searchresultlist: []));
      }
    });

    on<SearchResult>((event, emit) async {
      Searchlist movieimp = Searchlist();

      if (event.isresultopen == false) {
        emit(SearchBlocState(issearchbaropen: false, isnotsearching: true));
      }

      if (event.searchvalue == null || event.searchvalue!.isEmpty) {
        emit(SearchBlocState(issearchbaropen: true, searchresultlist: []));
      } else {
        final searchlist =
            await movieimp.getSearchresultdata(event.searchvalue!);

        emit(SearchBlocState(
            issearchbaropen: true,
            isnotsearching: false,
            searchresultlist: searchlist.sublist(0, 15)));
      }
    });
  }
}
