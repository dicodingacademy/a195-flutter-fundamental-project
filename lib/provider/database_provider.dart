import 'package:dicoding_news_app/data/db/database_helper.dart';
import 'package:dicoding_news_app/data/model/article.dart';
import 'package:flutter/foundation.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({@required this.databaseHelper}) {
    _getBookmarks();
  }

  List<Article> _bookmarks = [];

  List<Article> get bookmarks => _bookmarks;

  void _getBookmarks() async {
    _bookmarks = await databaseHelper.getBookmarks();
    notifyListeners();
  }

  void addBookmarks(Article article) async {
    await databaseHelper.insertBookmark(article);
    _getBookmarks();
  }

  Future<bool> isBookmarked(String url) async {
    final bookmarkedArticle = await databaseHelper.getBookmarkByUrl(url);
    return bookmarkedArticle.isNotEmpty;
  }

  void removeBookmark(String url) async {
    await databaseHelper.removeBookmark(url);
    _getBookmarks();
  }
}
