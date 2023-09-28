import 'package:get/get.dart';

mixin SnackbarMixin {
  void showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }
}
