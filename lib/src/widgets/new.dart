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
        _BodyCard(article: article),
        const _ButtonsCard(),
        const Divider(height: 20),
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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          child: (article.urlToImage != null)
              ? FadeInImage(
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Text(
                      '   Image not loaded   ',
                      style: TextStyle(
                          fontSize: 25, color: appTheme.colorScheme.secondary),
                    );
                  },
                  placeholder: const AssetImage('assets/giphy.gif'),
                  image: NetworkImage(article.urlToImage!),
                )
              : const Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article article;
  const _BodyCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(article.description ?? ''),
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: appTheme.colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        ),
      ],
    );
  }
}
