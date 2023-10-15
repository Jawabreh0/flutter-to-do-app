import 'package:todo/domain/enitity/task_entity.dart';

abstract class TaskInteractor {
  Future<void> saveTask(TaskEntity task);
  Future<List<TaskEntity>> getTasks();
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(int id);
  Future<void> updateTaskData(int id, String newDate, String newTime);
}
