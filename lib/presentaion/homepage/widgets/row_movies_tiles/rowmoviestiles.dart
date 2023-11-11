import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/application/homeblock/controller_bloc.dart';

import 'package:moviedb_project/presentaion/const/const.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/movie_tile/movie_tile.dart';

class RowMovietiles extends StatelessWidget {
  RowMovietiles({
    super.key,
  });

  final ScrollController controller = ScrollController();

  @override
  Widget build(context) {
    return BlocBuilder<ControllerBloc, ControllerState>(
      builder: (context, state) {
        if (state.isloading == true) {
          return const CircularProgressIndicator.adaptive();
        }
        return SizedBox(
          child: Stack(
            children: [
              ListView.separated(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, buildindex) {
                  final movie = state.latestmovielist[buildindex].posterPath;
                  return MovieTile(
                    width: 50 * 2.5,
                    image: '$movie',
                    qualitycontaineralign: Alignment.topRight,
                    isdurationcontaierisvisible: false,
                    isratingcontainerisvisible: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return width10;
                },
                itemCount: state.latestmovielist.length,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //LEFT SLIDING BUTTON
                    InkWell(
                      onTap: () {
                        print('haii');

                        scrollcontroller(0);
                      },
                      child: Container(
                        width: 35,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_left_outlined,
                          size: 33,
                        ),
                      ),
                    ),
                    //RIGHT SLIDING BUTTON
                    InkWell(
                      onTap: () {
                        scrollcontroller(1);
                      },
                      child: Container(
                        width: 35,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_right_outlined,
                          size: 33,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  scrollcontroller(int number) {
    final scroll = controller.position.maxScrollExtent;

    final item = scroll + maxwidth;

    if (number == 0) {
      controller.jumpTo(-item);
    } else {
      controller.jumpTo(item);
    }
  }
}
