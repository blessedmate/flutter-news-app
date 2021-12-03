import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/pages.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Material App',
        home: const TabsPage(),
      ),
    );
  }
}
