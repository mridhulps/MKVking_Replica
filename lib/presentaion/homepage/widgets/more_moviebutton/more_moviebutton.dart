import 'package:flutter/material.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

class Moremoviebutton extends StatelessWidget {
  final double? width;
  final String? text;
  final Color? color;
  final double? radius;
  final double? leftpadding;
  final double? rightpadding;
  final double? bottompadding;
  final double? toppadding;
 const Moremoviebutton(
      {super.key,
      this.width,
      this.text,
      this.color,
      this.radius,
      this.leftpadding,
      this.rightpadding,
      this.bottompadding,
      this.toppadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
          top: toppadding == null ? 0.0 : toppadding!,
          bottom: bottompadding == null ? 0.0 : bottompadding!,
          left: leftpadding == null ? 0.0 : leftpadding!,
          right: rightpadding == null ? 0.0 : rightpadding!),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius == null ? 0.0 : radius!)),
      child: Text(
        text!,
        style: const TextStyle(
            color: white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2),
      ),
    );
  }
}
