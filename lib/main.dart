import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_newsapp/views/home_view.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
