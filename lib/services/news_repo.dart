
import 'package:http/http.dart' as http;
import 'package:project_newsapp/constants/constants.dart';
import 'package:project_newsapp/models/article.dart';

abstract class NewsWebService {
  Future<List<Articles>> fetchNews();
  static var client = http.Client();
}

class NewsWebServiceImpl extends NewsWebService {
  @override
  Future<List<Articles>> fetchNews() async {
    var response =
    await NewsWebService.client.get(Uri.parse(Constants.TOP_HEADLINE));
    if (response.statusCode == 200) {
      return articlesFromJson(response.body);
    } else {
      throw Exception('failed');
    }
  }
}
