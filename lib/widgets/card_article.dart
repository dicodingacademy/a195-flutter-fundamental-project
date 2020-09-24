import 'package:dicoding_news_app/common/styles.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final Function onPressed;

  const CardArticle(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.author,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: image == null
            ? Container(width: 100, child: Icon(Icons.error))
            : Hero(
                tag: image,
                child: Image.network(
                  image,
                  width: 100,
                ),
              ),
        title: Text(
          title ?? "",
        ),
        subtitle: Text(author ?? ""),
        onTap: onPressed,
      ),
    );
  }
}
