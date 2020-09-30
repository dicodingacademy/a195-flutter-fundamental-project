import 'package:dicoding_news_app/data/model/article.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createObject();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createObject();
    }

    return _databaseHelper;
  }

  static const String _tblBookMark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/newsapp.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookMark (
             url TEXT PRIMARY KEY,
             author TEXT,
             title TEXT,
             description TEXT,
             urlToImage TEXT,
             publishedAt TEXT,
             content TEXT
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }

    return _database;
  }

  Future<void> insertBookmark(Article article) async {
    final db = await database;
    await db.insert(_tblBookMark, article.toJson());
  }

  Future<List<Article>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblBookMark);

    return results.map((res) => Article.fromJson(res)).toList();
  }

  Future<Map> getBookmarkByUrl(String url) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tblBookMark,
      where: 'url = ?',
      whereArgs: [url],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeBookmark(String url) async {
    final db = await database;

    await db.delete(
      _tblBookMark,
      where: 'url = ?',
      whereArgs: [url],
    );
  }
}
