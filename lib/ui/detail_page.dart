import 'package:dicoding_news_app/data/model/articles.dart';
import 'package:flutter/material.dart';

class BundleData {
  final Source source;
  final Articles articles;

  BundleData(this.source, this.articles);
}

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  @override
  Widget build(BuildContext context) {
    final BundleData args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args.articles.title),
      ),
      body: Container(),
    );
  }
}
