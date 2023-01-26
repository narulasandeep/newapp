import 'package:equatable/equatable.dart';
import 'package:project_newsapp/models/article.dart';

abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  List<Articles> articles;
  NewsLoadedState({required this.articles});
  @override
  Null get props => null;
}

class NewsErrorState extends NewsState {
  String message;
  NewsErrorState({required this.message});
  @override
  Null get props => null;
}
