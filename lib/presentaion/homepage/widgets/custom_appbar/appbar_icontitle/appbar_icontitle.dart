import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

class IconTitle extends StatelessWidget {
  final double? textsize;
  final double? iconsize;
  const IconTitle({super.key, this.textsize, this.iconsize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(
            Icons.movie_rounded,
            color: Colors.green,
            size: iconsize,
          ),
          width5,
          Text(
            'MKVKing.com',
            style: GoogleFonts.robotoSlab(
                fontSize: textsize,
                color: Colors.yellow,
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}

