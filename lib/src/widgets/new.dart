import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class New extends StatelessWidget {
  final Article article;
  final int index;

  const New({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HeaderCard(article: article, index: index),
        _TitleCard(article: article),
        _ImageCard(article: article),
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final Article article;
  final int index;

  const _HeaderCard({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: appTheme.colorScheme.secondary),
          ),
          Text('${article.source.name}. '),
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article article;

  const _TitleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article article;

  const _ImageCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
}
