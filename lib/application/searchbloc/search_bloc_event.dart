part of 'search_bloc_bloc.dart';

class SearchBlocEvent {
  const SearchBlocEvent();
}

class SearchingBar extends SearchBlocEvent {}

class SearchResult extends SearchBlocEvent {
  final bool isresultopen;
  final String? searchvalue;

  SearchResult({required this.isresultopen, this.searchvalue});
}
