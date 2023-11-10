import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/application/homeblock/controller_bloc.dart';

import 'package:moviedb_project/presentaion/const/const.dart';
import 'package:moviedb_project/presentaion/homepage/errorpage/error_page.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/custom_appbar/custom_appbar.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/more_moviebutton/more_moviebutton.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/movie_tile/movie_tile.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/movietile_with_details/movietiledetails.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/row_movies_tiles/rowmoviestiles.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/share_buttons/iconbutton/share_buttons.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/share_buttons/textbutton/textbutton.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/sliding_text/sliding_text.dart';
import 'package:moviedb_project/presentaion/searchpage/searchresultpage.dart';
import 'package:moviedb_project/presentaion/searchpage/searchtile.dart';

import 'package:number_paginator/number_paginator.dart';

import '../../application/searchbloc/search_bloc_bloc.dart';
import 'widgets/bottomfields/botttomfields.dart';
import 'widgets/mostmoviestile/mostmoviestiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ControllerBloc>().add(GetNowplayingMovielist());
    });

    return Scaffold(
        backgroundColor: scaffoldcolor,
        body: SafeArea(child: BlocBuilder<ControllerBloc, ControllerState>(
          builder: (context, state) {
            return state.isloading == true
                ? const LoadingPage()
                : Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      const CustomAppbar(),
                                      height20,
                                      BlocBuilder<SearchBlocBloc,
                                          SearchBlocState>(
                                        builder: (context, state) {
                                          if (state.issearchbaropen == true) {
                                            return const BottomFields(
                                                child: SearchTile());
                                          } else {
                                            return Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    null;
                                                  },
                                                  child: IconShareButton(
                                                    sharetext: 'Sharer',
                                                    icon: Icons.facebook_sharp,
                                                    color: Colors.blue.shade800,
                                                  ),
                                                ),
                                                width5,
                                                InkWell(
                                                  onTap: () => print(
                                                      'tweet button tapped'),
                                                  child: IconShareButton(
                                                    sharetext: 'Tweet',
                                                    icon: Icons.twelve_mp,
                                                    color: Colors.lightBlue,
                                                  ),
                                                ),
                                                width5,
                                                InkWell(
                                                    onTap: () => print(
                                                        'whatapp button tapped'),
                                                    child: ShareButton(
                                                      sharetext: 'WhatApp',
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 75, 213, 80),
                                                    )),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                      height10,
                                      BlocBuilder<SearchBlocBloc,
                                              SearchBlocState>(
                                          builder: (context, state) {
                                        return state.isnotsearching == false
                                            ? const Searchresultpage()
                                            : Visibility(
                                                visible: state.isnotsearching ??
                                                    true,
                                                child: Column(
                                                  children: [
                                                    const SlidingTextContainer(),

                                                    height10,
                                                    //ROW MOVIE TILES
                                                    LimitedBox(
                                                        maxHeight: 200,
                                                        maxWidth: maxwidth,
                                                        child: RowMovietiles()),
                                                    height20,
                                                    Moremoviebutton(
                                                      width: maxwidth,
                                                      text:
                                                          'FEATURE MOVIES 2023',
                                                      color: orangecolor,
                                                      radius: 5,
                                                      toppadding: 5,
                                                      bottompadding: 5,
                                                      leftpadding: 13,
                                                      rightpadding: 13,
                                                    ),
                                                    height10,
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Moremoviebutton(
                                                        width: null,
                                                        text: 'MORE MOVIE',
                                                        color: Colors
                                                            .green.shade400,
                                                        radius: 5,
                                                        toppadding: 5,
                                                        bottompadding: 5,
                                                        leftpadding: 17,
                                                        rightpadding: 17,
                                                      ),
                                                    ),
                                                    height10,

                                                    // SECOND MOVIE TILES
                                                    LimitedBox(
                                                      maxHeight: 1220,
                                                      child: BlocBuilder<
                                                          ControllerBloc,
                                                          ControllerState>(
                                                        builder:
                                                            (context, state) {
                                                          if (state.isloading ==
                                                              true) {
                                                            return const Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          }

                                                          return GridView
                                                              .builder(
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            gridDelegate:
                                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              mainAxisSpacing:
                                                                  10,
                                                              crossAxisSpacing:
                                                                  8,
                                                              childAspectRatio:
                                                                  0.67,
                                                            ),
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    index) {
                                                              final list = state
                                                                      .nowplayingmovielist[
                                                                  index];

                                                              return MovieTile(
                                                                width: 50 * 2.4,
                                                                image:
                                                                    '${list.posterPath}',
                                                                qualitycontaineralign:
                                                                    Alignment
                                                                        .topRight,
                                                                rating: list
                                                                    .voteAverage
                                                                    .toString(),
                                                              );
                                                            },
                                                            itemCount: state
                                                                .nowplayingmovielist
                                                                .length,
                                                          );
                                                        },
                                                      ),
                                                    ),

                                                    Moremoviebutton(
                                                      width: maxwidth,
                                                      text: 'TOP RATED MOVIE',
                                                      color: orangecolor,
                                                      radius: 3,
                                                      toppadding: 5,
                                                      bottompadding: 5,
                                                      leftpadding: 5,
                                                    ),
                                                    height20,

                                                    //MOVIEDETAILS,
                                                    LimitedBox(
                                                        maxHeight: 1000 * 2.36,
                                                        child: BlocBuilder<
                                                            ControllerBloc,
                                                            ControllerState>(
                                                          builder:
                                                              (context, state) {
                                                            if (state
                                                                    .isloading ==
                                                                true) {
                                                              return const SizedBox(
                                                                  width:
                                                                      maxwidth,
                                                                  height: 300,
                                                                  child: Center(
                                                                      child:
                                                                          CircularProgressIndicator()));
                                                            }
                                                            return GridView
                                                                .builder(
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                mainAxisSpacing:
                                                                    0,
                                                                crossAxisSpacing:
                                                                    8,
                                                                childAspectRatio:
                                                                    0.23,
                                                              ),
                                                              itemBuilder:
                                                                  ((context,
                                                                      index) {
                                                                final states =
                                                                    state.latestmovielist[
                                                                        index];
                                                                return MovieTileWithDetails(
                                                                  width:
                                                                      50 * 2.4,
                                                                  image: states
                                                                      .posterPath,
                                                                  ratingcontainerisvisible:
                                                                      true,
                                                                  durationcontaierisvisible:
                                                                      true,
                                                                  qualitycontainer:
                                                                      Alignment
                                                                          .bottomLeft,
                                                                  title: states
                                                                      .title,
                                                                  year: states
                                                                      .releaseDate,
                                                                  rating: states
                                                                      .voteAverage
                                                                      .toString(),
                                                                );
                                                              }),
                                                              itemCount: state
                                                                  .latestmovielist
                                                                  .length,
                                                            );
                                                          },
                                                        )),
                                                  ],
                                                ),
                                              );
                                      }),
                                      height10,
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: NumberPaginator(
                                          config: const NumberPaginatorUIConfig(
                                            buttonSelectedBackgroundColor:
                                                Colors.orange,
                                            buttonUnselectedForegroundColor:
                                                Colors.orange,
                                            height: 45,
                                          ),
                                          numberPages: 1000,
                                          initialPage: 0,
                                          onPageChange: (value) {},
                                        ),
                                      ),
                                      BottomFields(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, bottom: 8),
                                              hintText: 'Enter Movie',
                                              hintStyle: TextStyle(
                                                  color: Colors.white24)),
                                        ),
                                      ),
                                      const BottomFields(
                                        text: 'All Type',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'By Index',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'Order',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'All Genres',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'All Years',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'All Countries',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'All Qualities',
                                        color: white,
                                        leftpadding: 10,
                                      ),
                                      const BottomFields(
                                        text: 'Search',
                                        color: white,
                                        align: Alignment.center,
                                        fillcolor: Colors.orangeAccent,
                                      ),
                                      height20,
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'MOST VIEW MOVIES',
                                              style: TextStyle(
                                                  color: white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: orangecolor,
                                              thickness: 1.3,
                                              height: 17,
                                            ),
                                          )
                                        ],
                                      ),
                                      height20,
                                      LimitedBox(
                                        maxHeight: 799,
                                        child: BlocBuilder<ControllerBloc,
                                                ControllerState>(
                                            builder: (context, state) {
                                          return ListView.separated(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                final states = state
                                                    .nowplayingmovielist[index]
                                                    .posterPath;
                                                return Mostiewmoviestile(
                                                  posterimage: states ?? '',
                                                );
                                              },
                                              separatorBuilder:
                                                  ((context, index) =>
                                                      const Divider(
                                                        color: white,
                                                        thickness: 1.5,
                                                      )),
                                              itemCount: state
                                                  .nowplayingmovielist.length);
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: maxwidth,
                                height: 150,
                                color: Colors.grey.shade800,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 19, left: 10, right: 10),
                                  child: Text(
                                    "MkvKIng.com (2022) Disclaimer:-MkvKing does not host any files on it's servers.All files or contents hosted on third party websites. MkvKing does not accept responsibility for content hosted on third party websites. We just index those links which are already available in internet ",
                                    style: TextStyle(color: white, height: 1.3),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.grey.shade900,
                                width: maxwidth,
                                height: 50,
                                child: const Center(
                                    child: Text(
                                  '2023 - MkvKing.com',
                                  style: TextStyle(color: white),
                                )),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 45,
                              height: 45,
                              color: orangecolor,
                              child: const Icon(
                                Icons.keyboard_arrow_up,
                                color: white,
                              ),
                            )),
                      ),
                    ],
                  );
          },
        )));
  }
}
