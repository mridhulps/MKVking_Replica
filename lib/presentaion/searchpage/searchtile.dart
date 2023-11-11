import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/application/searchbloc/search_bloc_bloc.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10, bottom: 8),
          hintText: 'Enter Movie',
          hintStyle: TextStyle(color: Colors.white24)),
      onChanged: (value) {
        context
            .read<SearchBlocBloc>()
            .add(SearchResult(isresultopen: true, searchvalue: value));
      },
    );
  }
}
