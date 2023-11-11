// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviedb_project/data/core/api_constants.dart';
import 'package:moviedb_project/presentaion/const/const.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/more_moviebutton/more_moviebutton.dart';

class MovieTileWithDetails extends StatelessWidget {
  double width = 0.0;
  double? height = 0.0;

  AlignmentGeometry? qualitycontainer;
  bool? durationcontaierisvisible;
  bool? ratingcontainerisvisible;

  final String? image;
  final String? title;
  final String? year;
  final String? rating;

  MovieTileWithDetails(
      {super.key,
      required this.width,
      this.image,
      this.height,
      this.qualitycontainer,
      this.durationcontaierisvisible,
      required this.ratingcontainerisvisible,
      required this.title,
      required this.year,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('${ApiConstantsUrls.imageurl}$image'),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: Colors.black,
          ),
          // width: 50 * 2.4,
          width: width,
          height: 50 * 3.3,
          child: Stack(
            children: [
              Visibility(
                visible: ratingcontainerisvisible!,
                //RATING CONTAINER
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(5)),
                    color: Colors.black45,
                  ),
                  height: 20,
                  width: 10 * 5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          '⭐',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                        Text(
                          rating != null ? rating!.substring(0, 3) : '0.0',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //QUALITY CONTAINER
              Align(
                alignment: qualitycontainer!,
                child: Container(
                    height: 20,
                    width: 10 * 5,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5)),
                        color: Colors.green),
                    child: const Center(
                      child: Text(
                        'WEB-DL',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
              ),

              //DURATION CONTAINER
              Visibility(
                visible: durationcontaierisvisible ?? false,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(5)),
                      color: Colors.black45,
                    ),
                    height: 20,
                    width: 10 * 5.5,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.green,
                            size: 13,
                          ),
                          Text(
                            '112 min',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // MOVIE DETAILS CONTAINER
        Container(
          width: 50 * 2.5,
          padding: const EdgeInsets.only(top: 10),
          height: 300,
          decoration: BoxDecoration(
              color: Colors.grey.shade500.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // THIS CONTAINER TITLE ALWAYS KEEP CENTER
                  Container(
                    width: maxwidth,
                    alignment: Alignment.center,
                    child: Text(
                      title ?? 'Error',
                      style: TextStyle(color: orangecolor),
                    ),
                  ),
                  height20,
                  // THIS CONTAINER GENERS KEEP PADDING AND CENTER
                  Container(
                    width: maxwidth,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const Text(
                      'Action,Drama,comedy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.3,
                          color: Colors.white38,
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          decoration: TextDecoration.underline),
                    ),
                  ),

                  height25,
                  Moremoviebutton(
                    width: null,
                    text: 'TRAILER',
                    color: greencolor,
                    radius: 13,
                    toppadding: 9,
                    bottompadding: 9,
                    leftpadding: 13,
                    rightpadding: 13,
                  ),

                  height10,

                  Moremoviebutton(
                    width: null,
                    text: 'WATCH',
                    color: orangecolor,
                    radius: 13,
                    toppadding: 9,
                    bottompadding: 9,
                    leftpadding: 13,
                    rightpadding: 13,
                  )
                ]),
          ),
        )
      ],
    );
  }
}
