import 'package:dicoding_news_app/article.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  const Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${article.publishedAt}'),
                  const SizedBox(height: 10),
                  Text('Author: ${article.author}'),
                  const Divider(color: Colors.grey),
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Read more'),
                    onPressed: () {
                      Navigator.pushNamed(context, ArticleWebView.routeName,
                          arguments: article.url);
                    },
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

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
