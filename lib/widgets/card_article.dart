import 'package:dicoding_news_app/common/navigation.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:dicoding_news_app/provider/database_provider.dart';
import 'package:dicoding_news_app/ui/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: article.urlToImage == null
                    ? Container(width: 100, child: Icon(Icons.error))
                    : Hero(
                        tag: article.urlToImage,
                        child: Image.network(
                          article.urlToImage,
                          width: 100,
                        ),
                      ),
                title: Text(
                  article.title ?? "",
                ),
                subtitle: Text(article.author ?? ""),
                trailing: isBookmarked
                    ? IconButton(
                        icon: Icon(Icons.bookmark),
                        onPressed: () => provider.removeBookmark(article.url),
                      )
                    : IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () => provider.addBookmark(article),
                      ),
                onTap: () => Navigation.intentWithData(
                    ArticleDetailPage.routeName, article),
              ),
            );
          },
        );
      },
    );
  }
}
