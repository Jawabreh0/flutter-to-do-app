import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/presentation/login/controller/login_ctrl.dart';
import 'package:todo/presentation/login/widgets/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginWidgets(
      authentication: controller.authentication,
      getAvailableBiometrics: controller.getAvailableBiometrics,
    );
  }
}
