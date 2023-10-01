import 'package:flutter/material.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/entities/task_entity.dart';
import 'package:todo/presentation/features/task/widgets/task_screen_appbar.dart';
import 'package:todo/presentation/features/task/widgets/task_widgets.dart';

class TaskScreen extends StatelessWidget {
  final Task task;

  const TaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TaskScreenAppBar(),
          backgroundColor: appColor,
          elevation: 0),
      backgroundColor: appColor,
      body: TaskWidget(task: task),
    );
  }
}
