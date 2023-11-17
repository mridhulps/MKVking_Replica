import 'package:flutter/material.dart';

import 'package:moviedb_project/presentaion/const/const.dart';

class BottomScrollContainer extends StatelessWidget {
  const BottomScrollContainer({
    super.key,
    required this.scrollcontroller,
  });

  final ScrollController scrollcontroller;

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              final jumb = scrollcontroller.position.maxScrollExtent;
              scrollcontroller.animateTo(-jumb,
                  duration:const Duration(milliseconds: 3000),
                  curve: Curves.decelerate);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: orangecolor,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.keyboard_arrow_up,
                color: white,
                size: 35,
              ),
            ),
          )),
    );
  }
}

   


      