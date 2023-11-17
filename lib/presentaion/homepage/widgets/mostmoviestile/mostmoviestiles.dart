import 'package:flutter/material.dart';


import 'package:moviedb_project/presentaion/const/const.dart';
import 'package:moviedb_project/presentaion/homepage/widgets/movie_tile/movie_tile.dart';

class Mostiewmoviestile extends StatelessWidget {

  final  String posterimage;
  final String title;
  

  const Mostiewmoviestile({
    super.key,
    required this.posterimage,
    required this.title
  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
          width: 65,
          child: MovieTile(
            isdurationcontaierisvisible: false,
            isratingcontainerisvisible: false,
            isqualitycontainervisible: false,
            height: 95,
            image: posterimage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: orangecolor),
              ),
              height10,
              const Text('Horror,Thriller,Australia,United Kingdom \n',
                  style: TextStyle(
                      color: Colors.white30,
                      overflow: TextOverflow.fade,
                      fontSize: 12)),
            ],
          ),
        )
      ],
    );
  }
}
