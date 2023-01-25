import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project_newsapp/bloc/news_bloc.dart';
import 'package:project_newsapp/services/news_repo.dart';

import 'package:project_newsapp/views/home_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      home:  BlocProvider(
        create: (context) => NewsBloc(webService: NewsWebServiceImpl()),
    child: HomeView()),
    );
  }
}
