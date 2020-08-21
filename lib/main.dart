import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:dicoding_news_app/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'News App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // When using home, don’t define a initialRoute property.
      home: HomePage(title: title),
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
      },
    );
  }
}
