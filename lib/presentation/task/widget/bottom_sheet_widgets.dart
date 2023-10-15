import 'package:flutter/material.dart';
import 'package:todo/presentation/task/controller/bottom_sheet_controller.dart';
import 'package:todo/presentation/task/widget/bottom_sheet_fields.dart';
import 'package:todo/presentation/task/widget/bottom_sheet_send_icon.dart';
import 'package:todo/presentation/task/widget/bottom_sheet_tag_icon.dart';
import 'package:todo/presentation/task/widget/bottom_sheet_timer.dart';

class BottomSheetWidgets extends StatelessWidget {
  final BottomSheetController controller;

  const BottomSheetWidgets({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BottomSheetTopSection(controller: controller),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TimerIconButton(controller: controller),
                const SizedBox(width: 16.0),
                TagIconButton(controller: controller),
              ],
            ),
            Expanded(child: Container()),
            SendIconButton(controller: controller),
          ],
        ),
      ],
    );
  }
}
