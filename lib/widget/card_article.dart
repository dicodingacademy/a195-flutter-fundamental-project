import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final Function onPressed;

  const CardArticle(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.desc,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: onPressed,
              child: Hero(
                tag: image,
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            desc,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
