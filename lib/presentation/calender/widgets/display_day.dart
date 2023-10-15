import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/presentation/calender/controller/calender_controller.dart';

class DisplayDay extends StatelessWidget {
  final DateTime date;
  final CalendarController calendarController;

  const DisplayDay(this.date, this.calendarController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (calendarController.hasEvent(date)) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      } else {
        return Center(
          child: Text(
            date.day.toString(),
            style: const TextStyle(color: Colors.grey),
          ),
        );
      }
    });
  }
}
