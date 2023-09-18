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
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("[INFO] ... DB UPDATED ... )");
  }

  _onCreate(Database db, int version) async {
    // creating the table
    await db.execute('''
    CREATE TABLE Tasks (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      taskTitle TEXT NOT NULL,
      taskDescription TEXT NOT NULL,
      taskDate TEXT,  -- Storing date as text
      taskTime TEXT,  -- Storing time as text
      taskCategory TEXT,
      taskPrivacy INTEGER  -- Storing boolean (0 for false, 1 for true)
    )
  ''');
    print("[INFO] ... Table Created ... ");
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

  updateDate(String sql) async {
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
