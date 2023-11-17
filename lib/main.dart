import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_project/application/homeblock/controller_bloc.dart';
import 'package:moviedb_project/application/searchbloc/search_bloc_bloc.dart';

import 'package:moviedb_project/presentaion/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ControllerBloc()),
        BlocProvider(
          create: (context) => SearchBlocBloc(),
        )
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
