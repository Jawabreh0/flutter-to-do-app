import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';

class CalendarController extends GetxController {
  final HomeController taskController = Get.find();
  final DateFormat _dateFormat = DateFormat('dd-MM-yy');

  bool hasEvent(DateTime date) {
    String dateString = _dateFormat.format(date);
    return taskController.tasks.any((task) => task.date == dateString);
  }
}
