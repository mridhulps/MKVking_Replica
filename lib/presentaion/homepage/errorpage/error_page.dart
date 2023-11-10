import 'package:flutter/material.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

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
