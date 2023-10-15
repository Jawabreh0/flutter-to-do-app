import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayMonth extends StatelessWidget {
  final int month;
  final int year;

  const DisplayMonth(this.month, this.year, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        DateFormat('MMMM yyyy').format(DateTime(year, month)),
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
