import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import "package:path/path.dart";

class AppDatabase {
  static Database? _db;

  Future<Database?> get db async => _db ??= await _initialDb();

  Future<Database> _initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'ToDoApp.db');

    if (await databaseExists(path)) {
      return await openDatabase(path, version: 2);
    } else {
      return await openDatabase(path,
          version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Tasks (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      taskTitle TEXT NOT NULL,
      taskDescription TEXT NOT NULL,
      taskDate TEXT NOT NULL,
      taskTime TEXT NOT NULL,
      taskCompletion BOOLEAN DEFAULT 0,
      categoryId INTEGER
    );
  ''');

    await db.execute('''
CREATE TABLE Categories (
  catgID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  catgName TEXT NOT NULL,
  catgIcon INTEGER,
  catgColor INTEGER
);
''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
//TODO: On upgrade
  }
}
