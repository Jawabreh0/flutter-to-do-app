import 'package:flutter/material.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';
import 'package:todo/presentation/task/controller/bottom_sheet_controller.dart';

class TimerIconButton extends StatelessWidget {
  final BottomSheetController controller;

  const TimerIconButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.timerIcon),
      onPressed: () async {
        await controller.selectDateTime(context);
      },
      color: Colors.white,
    );
  }
}
