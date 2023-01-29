import 'package:equatable/equatable.dart';
import 'package:project_newsapp/models/article.dart';

abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}


class NewsLoadedState extends NewsState {
  List<Articles> articles;
  NewsLoadedState({required this.articles});
  @override
  List<Object> get props => [];
}
class NewsErrorState extends NewsState {
  String message;
  NewsErrorState({required this.message});
  @override
  List<Object> get props => [];
}
