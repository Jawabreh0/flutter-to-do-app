import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';
import 'package:todo/presentation/features/home/screen/home_screen.dart';

class TaskScreenAppBar extends StatelessWidget {
  const TaskScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: modifyTaskColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.offAll(const HomeScreen());
            },
            icon: const BuildSvgIcon(assetKey: AssetKeys.cancelIcon),
          ),
        ),
        Container(
          width: 120,
          height: 35,
          decoration: BoxDecoration(
            color: modifyTaskColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              LangKeys.MARK_AS_COMPLETE,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
