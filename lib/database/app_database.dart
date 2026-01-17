import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  static Future<Database> _init() async {
    final path = join(await getDatabasesPath(), 'quick_assist.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE security (
            id INTEGER PRIMARY KEY,
            pin TEXT
          )
        ''');

        // example user data tables
        await db.execute('''
          CREATE TABLE user_data (
            id INTEGER PRIMARY KEY,
            value TEXT
          )
        ''');
      },
    );
  }

  static Future<void> clearAll() async {
    final database = await db;
    await database.delete('security');
    await database.delete('user_data');
  }
}
