// todo-01-local-03: create a service that handle a database service
import 'package:sqflite/sqflite.dart';
import 'package:tourism_app/data/model/tourism.dart';

class LocalDatabaseService {
  // todo-01-local-04: make a static value
  static const String _databaseName = 'tourism-app.db';
  static const String _tableName = 'tourism';
  static const int _version = 1;

  // todo-01-local-05: add a table to create a table
  Future<void> createTables(Database database) async {
    await database.execute(
      """CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        address TEXT,
        longitude REAL,
        latitude REAL,
        like INTEGER,
        image TEXT
      )
      """,
    );
  }

  // todo-01-local-06: make connection with database
  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // todo-01-local-07: create new item
  Future<int> insertItem(Tourism tourism) async {
    final db = await _initializeDb();

    final data = tourism.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-local-08: read all items
  Future<List<Tourism>> getAllItems() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName);

    return results.map((result) => Tourism.fromJson(result)).toList();
  }

  // todo-01-local-09: get a single item by id
  Future<Tourism> getItemById(int id) async {
    final db = await _initializeDb();
    final results =
        await db.query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);

    return results.map((result) => Tourism.fromJson(result)).first;
  }

  // todo-01-local-10: delete an item by id
  Future<int> removeItem(int id) async {
    final db = await _initializeDb();

    final result =
        await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return result;
  }
}
