import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin SnackbarMixin {
  void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.white,
    );
  }
}
