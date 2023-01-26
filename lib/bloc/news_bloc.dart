
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_newsapp/bloc/news_event.dart';
import 'package:project_newsapp/bloc/news_state.dart';
import 'package:project_newsapp/models/article.dart';
import 'package:project_newsapp/services/news_repo.dart';
//import 'package:groceries_app/bloc/food_event.dart';
//import 'package:groceries_app/bloc/food_state.dart';
//import 'package:groceries_app/data/model/food.dart';
//import 'package:groceries_app/data/repositories/food_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsWebService webService;

  NewsBloc({required this.webService}) : super(null);

  NewsState get initialState => NewsInitialState();
  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsEvent) {
      yield NewsLoadingState();

      try {
        List<Articles> articles = await webService.fetchNews();
        yield NewsLoadedState(articles: articles);
      } catch (e) {
        yield NewsErrorState(message: e.toString());
      }
    }
  }
}
