import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/category_model.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final _URL_BASE = 'newsapi.org';
  final _API_KEY = '68c9a5c7d0f742b6a570ccd04cdb6d4f';

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.basketballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  String _selectedCategory = 'business';

  // List of articles by category
  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    // Initialize the articles by category list with empty lists
    for (var element in categories) {
      categoryArticles[element.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;

    getHeadlinesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesBySelectedCategory =>
      categoryArticles[selectedCategory]!;

  /// Get the top headlines from a specific country.
  getTopHeadlines() async {
    final url = Uri.https(
      _URL_BASE,
      '/v2/top-headlines',
      {'country': 'co', 'apiKey': _API_KEY},
    );
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  /// Get the top headlines of a specified category from a specific country.
  getHeadlinesByCategory(String category) async {
    // If category articles were loaded before, return them
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final url = Uri.https(
      _URL_BASE,
      '/v2/top-headlines',
      {'country': 'us', 'apiKey': _API_KEY, 'category': category},
    );
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    // Populate the list of articles by category from response
    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}
