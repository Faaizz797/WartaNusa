import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/response_news.dart';

class NetClient {
  final String baseUrl = "https://berita-indo-api-next.vercel.app/api/";

  Future<ResponseNews> fetchNews({required String news}) async {
    final response = await http.get(Uri.parse(baseUrl + news));

    try {
      if (response.statusCode == 200) {
        return ResponseNews.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load news.");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

