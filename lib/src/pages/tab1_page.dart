import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;

    return Scaffold(
      body: headlines.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                  color: appTheme.colorScheme.secondary))
          : NewsList(news: headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
