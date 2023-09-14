// login_screen.dart

import 'package:flutter/material.dart';
import '../widget/login_widgets.dart';
import '../controller/login_ctrl.dart';
import 'package:get/get.dart';
import 'package:to_do/core/app-colors/palette.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
      ),
      backgroundColor: appColor,
      body: LoginWidgets.buildBody(),
      bottomNavigationBar: LoginWidgets.buildBottomButton(
          controller.authentication, controller.getAvailableBiometrics),
    );
  }
}
