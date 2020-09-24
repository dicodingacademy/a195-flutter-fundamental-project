import 'package:dicoding_news_app/common/bundle_data.dart';
import 'package:dicoding_news_app/common/navigation.dart';
import 'package:dicoding_news_app/ui/article_web_view.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final BundleData bundleData;

  const ArticleDetailPage({@required this.bundleData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bundleData.articles.urlToImage == null
                ? Container(
                    height: 200,
                    child: Icon(Icons.error),
                  )
                : Hero(
                    tag: bundleData.articles.urlToImage,
                    child: Image.network(bundleData.articles.urlToImage),
                  ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bundleData.articles.description ?? "",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    bundleData.articles.title ?? "",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date: ${bundleData.articles.publishedAt}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        bundleData.source.name ?? "",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Author: ${bundleData.articles.author}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    bundleData.articles.content ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text('Read more'),
                    onPressed: () {
                      Navigation.intentWithData(
                          ArticleWebView.routeName, bundleData.articles.url);
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
