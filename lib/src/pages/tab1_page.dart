import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;

    return Scaffold(
      body: NewsList(news: headlines),
    );
  }
}
