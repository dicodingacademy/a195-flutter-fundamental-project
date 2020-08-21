import 'package:dicoding_news_app/article.dart';
import 'package:dicoding_news_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
        ),
      ),
      home: NewsListPage(),
    );
  }
}

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
        ),
        elevation: 0,
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView(
            children: articles
                .map((article) => _buildArticleItem(context, article))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(
        article.title,
      ),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(url: article.url),
          ),
        );
      },
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final String url;

  ArticleDetailPage({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: url,
            ),
            Card(
              margin: EdgeInsets.all(0),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'N',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
