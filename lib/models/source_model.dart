import 'package:project_newsapp/models/source_model.dart';

class Source {
  String id;

  String name;

  Source({required this.name, required this.id});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(name: json['name'], id: json['id']);
  }
}