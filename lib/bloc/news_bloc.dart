import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_newsapp/bloc/news_event.dart';
import 'package:project_newsapp/bloc/news_state.dart';
import 'package:project_newsapp/models/article.dart';
import 'package:project_newsapp/services/news_repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsWebService webService;
  NewsBloc({required this.webService}) : super(NewsInitialState()){
    on<FetchNewsEvent>((event, emit) async {
      if (event is NewsEvent) {
        emit(NewsInitialState());
        try {
          List<Articles> articles = await webService.fetchNews();
          emit(NewsLoadedState(articles: articles));
        } catch (e) {
          emit(NewsErrorState(message: e.toString()));
        }
      }
    }
    );
  }
}
