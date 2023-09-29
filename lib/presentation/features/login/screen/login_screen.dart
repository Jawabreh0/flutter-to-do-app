import 'package:flutter/material.dart';
import 'package:todo/presentation/features/login/widgets/login_widget.dart';
import '../controller/login_ctrl.dart';
import 'package:get/get.dart';

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
