import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/calender/controller/calender_controller.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:todo/presentation/calender/widgets/display_day.dart';
import 'package:todo/presentation/calender/widgets/display_month.dart';
import 'package:todo/presentation/calender/widgets/week_day.dart';

class CalendarWidgets extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());
  final TextStyle _weekDayTextStyle = const TextStyle(color: Colors.white);

  CalendarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          WeekDay(weekDayTextStyle: _weekDayTextStyle),
          const Divider(color: Colors.white, thickness: 1.0),
          Expanded(
            child: PagedVerticalCalendar(
              monthBuilder: (
                context,
                month,
                year,
              ) =>
                  DisplayMonth(month, year),
              dayBuilder: (context, date) =>
                  DisplayDay(date, calendarController),
            ),
          ),
        ],
      ),
    );
  }
}
// order by 