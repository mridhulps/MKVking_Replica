// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

class IconShareButton extends StatelessWidget {
  String? sharetext;
  Color? color;

  final icon;
  IconShareButton({super.key, this.sharetext, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        width: 70,
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: white,
              size: 16,
            ),
            width5,
            Text(
              sharetext!,
              style: const TextStyle(color: white, fontSize: 12),
            )
          ],
        ));
  }
}
