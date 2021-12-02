import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('loading headlines');
  }
}
