import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviedb_project/application/searchbloc/search_bloc_bloc.dart';

import 'package:moviedb_project/presentaion/homepage/widgets/movietile_with_details/movietiledetails.dart';

class Searchresultpage extends StatelessWidget {
  const Searchresultpage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<SearchBlocBloc>().add(SearchResult(isresultopen: false));

        return false;
      },
      child: LimitedBox(
          maxHeight: 1000 * 2.36,
          child: BlocBuilder<SearchBlocBloc, SearchBlocState>(
            builder: (context, state) {
              if (state.searchresultlist!.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.23,
                ),
                itemBuilder: ((context, index) {
                  final states = state.searchresultlist![index];
                  log(states.title.toString());
                  return MovieTileWithDetails(
                    width: 50 * 2.4,
                    image: states.posterPath,
                    ratingcontainerisvisible: true,
                    durationcontaierisvisible: true,
                    qualitycontainer: Alignment.bottomLeft,
                    title: states.title,
                    year: states.releaseDate,
                    rating: states.voteAverage.toString(),
                  );
                }),
                itemCount: state.searchresultlist!.length,
              );
            },
          )),
    );
  }
}
