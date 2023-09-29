import 'package:todo/data/gateways/task_gateway.dart';
import 'package:todo/domain/entities/task_entity.dart';

class TaskInteractor {
  final TaskGateway _taskGateway = TaskGateway();

  void addTask(String title, String description, String date, String time) {
    Task task = Task(
      id: 0,
      title: title,
      description: description,
      date: date,
      time: time,
    );
    _taskGateway.addTask(task);
  }

  Future<List<Task>> getTasks() {
    return _taskGateway.fetchTasks();
  }
}
