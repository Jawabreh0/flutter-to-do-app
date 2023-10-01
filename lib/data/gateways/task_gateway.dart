import 'package:todo/core/database/database.dart';
import 'package:todo/domain/entities/task_entity.dart';

class TaskGateway {
  final AppDatabase _appDatabase = AppDatabase();

  Future<void> addTask(Task task) async {
    final db = await _appDatabase.db;
    await db?.insert("Tasks", {
      "taskTitle": task.title,
      "taskDescription": task.description,
      "taskDate": task.date,
      "taskTime": task.time,
      "taskCompletion": task.completed ? 1 : 0, // Added this
    });
  }

  Future<List<Task>> fetchTasks() async {
    final db = await _appDatabase.db;
    final List<Map<String, Object?>>? maps = await db?.query("Tasks");

    if (maps == null) return [];

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'] as int,
        title: maps[i]['taskTitle'] as String,
        description: maps[i]['taskDescription'] as String,
        date: maps[i]['taskDate'] as String,
        time: maps[i]['taskTime'] as String,
        completed: (maps[i]['taskCompletion'] as int? ?? 0) == 1 ? true : false,
      );
    });
  }

  Future<void> updateTaskCompletion(int id, bool completed) async {
    final db = await _appDatabase.db;
    await db?.update(
      'Tasks',
      {'taskCompletion': completed ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateTask(
      int id, String newTitle, String newDescription) async {
    final db = await _appDatabase.db;
    await db?.update(
      'Tasks',
      {'taskTitle': newTitle, 'taskDescription': newDescription},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
