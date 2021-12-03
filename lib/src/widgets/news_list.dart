import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:flutter_news_app/src/widgets/widgets.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (_, index) {
        return New(
          article: news[index],
          index: index,
        );
      },
    );
  }
}
