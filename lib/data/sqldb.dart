import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    // create database path
    String databasepath = await getDatabasesPath();
    // join the db path with the db name
    String path = join(databasepath, 'ToDoApp.db');
    // database creation
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("[INFO] ... Database UPDATED ... )");
  }

  _onCreate(Database db, int version) async {
    // Creating the 'Tasks' table
    await db.execute('''
    CREATE TABLE Tasks (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  taskTitle TEXT NOT NULL,
  taskDescription TEXT NOT NULL,
  taskDate TEXT NOT NULL,
  taskTime TEXT NOT NULL,
  taskCategory TEXT NOT NULL,
  taskPrivacy INTEGER DEFAULT 0, -- Default to false (0)
  taskCompletion BOOLEAN DEFAULT 0 -- Default to false (0)
);

  ''');

    // Creating the 'Categories' table
    await db.execute('''
    CREATE TABLE Categories (
      catgID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      catgName TEXT NOT NULL,
      catgIcon TEXT NOT NULL,
      catgColor TEXT NOT NULL,
      materialIconCodePoint INTEGER,  
      materialIconFontFamily TEXT,
      materialIconFontPackage TEXT,
      materialIconDirection BOOLEAN
    );
  ''');

    print("[INFO] ... Tables Created ... ");
  }

// SELECT

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
