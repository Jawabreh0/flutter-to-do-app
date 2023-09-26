// login_ctrl.dart

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:to_do/presentation/features/home/screen/home_screen.dart';

class LoginController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();

  bool supportState = false;

  @override
  void onInit() {
    super.onInit();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    try {
      bool isSupported = await auth.isDeviceSupported();
      supportState = isSupported;
      update();
    } catch (e) {
      e.printError();
    }
  }

  Future<void> authentication() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "Verify identity to access your To-Do App",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        Get.offAll(() => HomeScreen());
      }
    } on PlatformException catch (e) {
      e.printError();
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
      bool supportState = await auth.isDeviceSupported();
      if (supportState) {
      } else {
        supportState.printInfo();
      }
    } catch (e) {
      e.printError();
    }
  }
}
