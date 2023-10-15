import 'package:sqflite/sqflite.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/domain/enitity/task_entity.dart';

class TaskGateway {
  final AppDatabase _appDatabase;

  TaskGateway(this._appDatabase);

  Future<void> saveTask(TaskEntity task) async {
    final Database? db = await _appDatabase.db;
    await db!.insert('Tasks', task.toMap());
  }

  Future<List<TaskEntity>> getTasks() async {
    final Database? db = await _appDatabase.db;
    final List<Map<String, dynamic>> maps = await db!.query('Tasks');
    return List.generate(
      maps.length,
      (i) => TaskEntity.fromMap(maps[i]),
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    final Database? db = await _appDatabase.db;
    await db!.update(
      'Tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final Database? db = await _appDatabase.db;
    await db!.delete(
      'Tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateTaskData(int id, String newDate, String newTime) async {
    final Database? db = await _appDatabase.db;
    await db!.update(
      'Tasks',
      {'taskDate': newDate, 'taskTime': newTime},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
