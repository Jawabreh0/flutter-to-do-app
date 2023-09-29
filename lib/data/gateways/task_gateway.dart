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
      );
    });
  }
}