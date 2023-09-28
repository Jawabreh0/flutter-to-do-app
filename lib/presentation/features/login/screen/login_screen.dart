// Clean

import 'package:flutter/material.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/login/widgets/login_widget.dart';
import '../controller/login_ctrl.dart';
import 'package:get/get.dart';

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
