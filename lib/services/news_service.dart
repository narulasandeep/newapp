import 'package:http/http.dart' as http;
import 'package:project_newsapp/constants/constants.dart';
import 'package:project_newsapp/models/article.dart';


class NewsWebService {

  static var client = http.Client();

  static Future<List<Articles>?> fetchNews() async {

    var response = await  client.get(Uri.parse(Constants.TOP_HEADLINE));

    if (response.statusCode == 200) {
      return articlesFromJson(response.body);
    } else {
      return null;
    }

  }

}