import 'package:flutter/material.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/presentation/task/widget/task_widgets.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskEntity task;

  const EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appColor, elevation: 0),
      backgroundColor: appColor,
      body: TaskWidgets(task: task),
    );
  }
}
