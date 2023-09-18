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
      print(e);
    }
  }

  Future<void> authentication() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "Verify identity to access you're To Do App",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      print("AUTHENTICATED : $authenticated");

      if (authenticated) {
        Get.offAll(HomeScreen());
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
      bool supportState = await auth.isDeviceSupported();
      if (supportState) {
        print('supported');
      } else {
        print('not supported');
      }
    } catch (e) {
      print(e);
    }
  }
}
