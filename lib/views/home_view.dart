import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:get/get.dart';
import 'package:project_newsapp/bloc/news_bloc.dart';
import 'package:project_newsapp/bloc/news_event.dart';
import 'package:project_newsapp/bloc/news_state.dart';
//import 'package:project_newsapp/controllers/news_controller.dart';
//import 'package:project_newsapp/models/article.dart';
//import 'package:project_newsapp/views/articles_details_page.dart';
import 'package:project_newsapp/views/error.dart';
import 'package:project_newsapp/views/list.dart';
import 'package:project_newsapp/views/loading.dart';

class HomeView extends StatefulWidget {
  
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late NewsBloc newsBloc;

  @override
  void initState() {
    newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(FetchNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   // final NewsController _newsController = Get.put(NewsController());
    return Scaffold(
        backgroundColor: const Color(0xFF464646),
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          title: const Text(
            " HEADLINES",
            style: TextStyle(
                fontSize: 29,
                letterSpacing: 2.0,
                color: Color(0xFF464646),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body:Center(

          child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
    if (state is NewsInitialState) {
    return buildLoading();
    } else if (state is NewsLoadedState) {
    return buildHintsList(state.articles);
    } else if (state is NewsErrorState) {
    return buildError(state.message);

    }
    else return buildLoading();
    }),
        ),
    );
  }
}
