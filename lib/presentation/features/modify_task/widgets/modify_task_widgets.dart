import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/app-colors/palette.dart';

class ModifyTaskWidgets {
  static Widget modifyTaskAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 23, top: 0),
        decoration: BoxDecoration(
          color: modifyTaskColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(bottom: 25, top: 0),
          decoration: BoxDecoration(
            color: modifyTaskColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Mark as Complete",
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

  static Widget modifyTaskkBody() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the left
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(
              color: fieldBordersColor,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: SvgPicture.asset(
                'assets/icons/share.svg',
                width: 24,
                height: 24,
              ),
              label: const Text('Share task'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 24,
                height: 24,
              ),
              label: const Text('Calendar'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: SvgPicture.asset(
                'assets/icons/trash.svg',
                width: 24,
                height: 24,
              ),
              label: Text(
                'Delete Task',
                style: TextStyle(color: deleteTaskRedColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
