import 'package:flutter/material.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

// ignore: must_be_immutable
class ShareButton extends StatelessWidget {
  String? sharetext;
   Color? color;
  ShareButton({super.key, this.sharetext,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(6)),

        width: 70,
        height: 35,
        child: Center(
          child: Text(
            sharetext!,
            style:const TextStyle(
              color: white,
              fontSize: 12,
              
            ),
          ),
        ));
  }
}
