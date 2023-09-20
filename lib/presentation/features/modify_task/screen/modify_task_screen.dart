import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:to_do/presentation/features/modify_task/widgets/modify_task_widgets.dart';

class ModifyTaskScreen extends StatelessWidget {
  const ModifyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: ModifyTaskWidgets.modifyTaskAppBar(),
      ),
      body: ModifyTaskWidgets.modifyTaskkBody(),
      backgroundColor: appColor,
    );
  }
}
