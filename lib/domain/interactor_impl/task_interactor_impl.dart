import 'package:todo/data/gateways/task_gateway.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/domain/interactor/task_interactor.dart';

class TaskInteractorImpl implements TaskInteractor {
  final TaskGateway _taskGateway;

  TaskInteractorImpl(this._taskGateway);

  @override
  Future<void> saveTask(TaskEntity task) async {
    await _taskGateway.saveTask(task);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    return await _taskGateway.getTasks();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    return await _taskGateway.updateTask(task);
  }

  @override
  Future<void> deleteTask(int id) async {
    return await _taskGateway.deleteTask(id);
  }

  @override
  Future<void> updateTaskData(int id, String newDate, String newTime) async {
    return await _taskGateway.updateTaskData(id, newDate, newTime);
  }
}
