import 'package:flutter/material.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldcolor,
      body: const SafeArea(
          child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      )),
    );
  }
}
