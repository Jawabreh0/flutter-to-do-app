import 'package:flutter/material.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';

class EditTaskTime extends StatelessWidget {
  final String date;
  final String time;
  final Function() timeCallback;

  const EditTaskTime(
      {super.key,
      required this.date,
      required this.time,
      required this.timeCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              BuildSvgIcon(assetKey: AssetKeys.timerIcon),
              SizedBox(width: 8),
              Text(
                LangKeys.TASK_TIME_,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: timeCallback,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(bottomSheetColor),
            ),
            child: Text(
              "$date At $time",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
