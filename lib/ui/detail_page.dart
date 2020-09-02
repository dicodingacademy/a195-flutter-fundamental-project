import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_news_app/common/bundle_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Text(args.articles.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: args.articles.urlToImage,
              child: CachedNetworkImage(
                imageUrl: args.articles.urlToImage,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.articles.description,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    args.articles.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date: ${args.articles.publishedAt}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        args.source.name,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Author: ${args.articles.author}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    args.articles.content,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'More info: ',
                          style: Theme.of(context).textTheme.bodyText1,
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
