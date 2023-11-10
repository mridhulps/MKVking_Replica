import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

import 'package:moviedb_project/presentaion/homepage/widgets/custom_appbar/appbar_icontitle/appbar_icontitle.dart';

import '../../../../application/searchbloc/search_bloc_bloc.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const IconTitle(
          textsize: 23,
          iconsize: 50,
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  context.read<SearchBlocBloc>().add(SearchingBar());
                },
                child: Icon(Icons.search, color: orangecolor)),
            width10,
            Icon(
              Icons.menu,
              color: orangecolor,
              size: 30,
            )
          ],
        ),
      ]),
    );
  }
}
