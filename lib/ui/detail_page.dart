import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_news_app/data/model/articles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BundleData {
  final Source source;
  final Articles articles;

  BundleData(this.source, this.articles);
}

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final BundleData args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: args.articles.urlToImage,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(args.articles.description),
                  Divider(color: Colors.grey),
                  Text(
                    args.articles.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date: ${args.articles.publishedAt}'),
                      Text(args.source.name),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Author: ${args.articles.author}'),
                  Divider(color: Colors.grey),
                  Text(
                    args.articles.content,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'More info: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: args.articles.url,
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _launchURL(args.articles.url),
                        ),
                      ],
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
