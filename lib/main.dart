import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/tabs_page.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Material App',
      home: TabsPage(),
    );
  }
}
