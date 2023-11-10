

import 'package:flutter/material.dart';
import 'package:moviedb_project/data/core/api_constants.dart';

// ignore: must_be_immutable
class MovieTile extends StatelessWidget {
  final double? width;
  final double? height;

  final String? rating;

  final AlignmentGeometry? qualitycontaineralign;
  bool? isqualitycontainervisible = false;
  bool? isdurationcontaierisvisible = false;
  bool? isratingcontainerisvisible = false;

  final String? image;

  MovieTile(
      {super.key,
      this.width,
      this.image,
      this.height,
      this.rating,
      this.qualitycontaineralign,
      this.isdurationcontaierisvisible,
      this.isratingcontainerisvisible,
      this.isqualitycontainervisible});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('${ApiConstantsUrls.imageurl}$image'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          // width: 50 * 2.4,
        ),
        Visibility(
            visible: isratingcontainerisvisible ?? true,
            child: rating != null
                ? Container(
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
                          rating != null
                              ? Text(
                                  rating!.length != 1 ? '$rating' : '$rating.0',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12.2),
                                )
                              : const Text(''),
                        ],
                      ),
                    ),
                  )
                : Container()),
        Visibility(
          visible: isqualitycontainervisible ?? true,
          child: Align(
            alignment: qualitycontaineralign ?? Alignment.center,
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
        ),
        Visibility(
          visible: isdurationcontaierisvisible ?? false,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5)),
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
      ]),
    );
  }
}
