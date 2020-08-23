import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  static Future<Database> database() async {
    final String defaultDbLocation = await getDatabasesPath();
    final String dbPath = join(defaultDbLocation, 'places.db');
    return openDatabase(dbPath,
        version: 1,
        onCreate: (db, version) => db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)'));
  }

  static Future<void> insert(
      {@required String table, @required Map<String, dynamic> data}) async {
    final Database db = await Db.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final Database db = await Db.database();
    return db.query(table);
  }
}
