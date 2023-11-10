import 'package:flutter/material.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

// ignore: must_be_immutable
class BottomFields extends StatelessWidget {
  final String? text;
  final dynamic child;
  final Color? color;
  final Alignment? align;
  final double? leftpadding;
  final Color? fillcolor;
  const BottomFields(
      {super.key,
      this.text,
      this.child,
      this.color,
      this.align,
      this.leftpadding,
      this.fillcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
          height: 40,
          width: maxwidth,
          decoration: BoxDecoration(
              color: fillcolor,
              border: Border.all(color: white, width: 0.6),
              borderRadius: BorderRadius.circular(7)),
          child: Center(
              child: child ??
                  Align(
                    alignment: align ?? Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: leftpadding ?? 0),
                      child: Text(
                        text ?? '',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
