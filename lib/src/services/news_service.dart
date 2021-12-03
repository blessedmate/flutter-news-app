import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final _URL_BASE = 'newsapi.org';
  final _API_KEY = '68c9a5c7d0f742b6a570ccd04cdb6d4f';

  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  /// Get the top headlines from a specific country.
  getTopHeadlines() async {
    final url = Uri.https(
      _URL_BASE,
      '/v2/top-headlines',
      {'country': 'us', 'apiKey': _API_KEY},
    );
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
