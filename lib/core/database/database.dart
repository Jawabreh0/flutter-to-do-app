import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import "package:path/path.dart";

class AppDatabase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'ToDoApp.db');
    Database myDb = await openDatabase(path, version: 2, onCreate: _onCreate);
    return myDb;
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create the Tasks table
    await db.execute('''
    CREATE TABLE Tasks (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      taskTitle TEXT NOT NULL,
      taskDescription TEXT NOT NULL,
      taskDate TEXT NOT NULL,
      taskTime TEXT NOT NULL,
      taskCategory TEXT ,
      taskPrivacy INTEGER DEFAULT 0,
      taskCompletion BOOLEAN DEFAULT 0
    );
  ''');

    // Create the Categories table
    await db.execute('''
    CREATE TABLE Categories (
      catgID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      catgName TEXT ,
      catgIcon INTEGER ,
      catgColor TEXT
    );
  ''');
  }
}
