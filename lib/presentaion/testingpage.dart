import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moviedb_project/data/data_sources/movie_remotedata.dart';
import 'package:moviedb_project/presentaion/const/const.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  @override
  Widget build(BuildContext context) {
    final data = MovieDataImpt();

  print('build called');
    return Scaffold(
      backgroundColor: scaffoldcolor,
      body: SafeArea(
          child: ListView.builder(
              itemBuilder: (context, index) {
                final list = data.pagelist[index][index].title;
                log('called');
                return Card(
                  color: white,
                  child: SizedBox(
                    height: 30,
                    child: Text(list??''),
                  ),
                );
              },
              itemCount: data.pagelist.length)),
    );
  }
}
