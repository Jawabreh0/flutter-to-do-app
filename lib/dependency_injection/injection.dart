import 'package:get/get.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/data/gateways/category_gateway.dart';
import 'package:todo/data/gateways/task_gateway.dart';
import 'package:todo/domain/interactor/category_interactor.dart';
import 'package:todo/domain/interactor_impl/category_interactor_impl.dart';
import 'package:todo/domain/interactor/task_interactor.dart';
import 'package:todo/domain/interactor_impl/task_interactor_impl.dart';
import 'package:todo/presentation/calender/controller/calender_controller.dart';
import 'package:todo/presentation/task/controller/bottom_sheet_controller.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';
import 'package:todo/presentation/task/controller/edit_task_controller.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => AppDatabase());

    // Task dependencies
    Get.lazyPut(() => TaskGateway(Get.find()));
    Get.lazyPut<TaskInteractor>(() => TaskInteractorImpl(Get.find()));
    Get.lazyPut(() => BottomSheetController());
    Get.lazyPut(() => HomeController(Get.find(), Get.find())); // Updated here
    Get.lazyPut(() => EditTaskController(Get.find()));

    // Category dependencies
    Get.lazyPut(() => CategoryGateway(Get.find()));
    Get.lazyPut<CategoryInteractor>(() => CategoryInteractorImpl(Get.find()));
    Get.lazyPut(() => CategoryController(Get.find()));
    Get.lazyPut(() => CalendarController());
  }
}
