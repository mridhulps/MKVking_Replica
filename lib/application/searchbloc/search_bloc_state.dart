part of 'search_bloc_bloc.dart';

class SearchBlocState {
  SearchBlocState(
      {required this.issearchbaropen,
      this.isnotsearching,
      this.searchresultlist,
      this.issearchvalueempty});

  final bool issearchbaropen;
  final bool? isnotsearching;
  final bool? issearchvalueempty;

  final List<MovieResponseModel>? searchresultlist;
}

class SearchBlocInitial extends SearchBlocState {
  SearchBlocInitial()
      : super(
            issearchbaropen: false, isnotsearching: true, searchresultlist: []);
}
