import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'package:moviedb_project/presentaion/const/const.dart';

class SlidingTextContainer extends StatelessWidget {
  const SlidingTextContainer({super.key});

  final slidingtext =
      'Welcome To MkvKing-MkvKing.com For Easy Access Bookmark--->MkvKing.cc<---';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 4),
        width: maxwidth,
        height: 30 * 1.1,
        decoration: BoxDecoration(
            color: slidingtextContainerColor,
            borderRadius: BorderRadius.circular(6)),
        child: Marquee(
            velocity: 20,
            blankSpace: 50 * 5,
            style: const TextStyle(color: Colors.green),
            text: slidingtext));
  }
}
