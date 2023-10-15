import 'package:flutter/widgets.dart';

class WeekDay extends StatelessWidget {
  final TextStyle weekDayTextStyle;

  const WeekDay({super.key, required this.weekDayTextStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("SU", style: weekDayTextStyle),
          Text("MO", style: weekDayTextStyle),
          Text("TU", style: weekDayTextStyle),
          Text("WE", style: weekDayTextStyle),
          Text("TH", style: weekDayTextStyle),
          Text("FR", style: weekDayTextStyle),
          Text("SA", style: weekDayTextStyle),
        ],
      ),
    );
  }
}
