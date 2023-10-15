import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/error_dialog.dart';
import 'package:todo/presentation/home/screen/home_screen.dart';

class LoginController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();

  bool supportState = false;

  @override
  void onInit() {
    super.onInit();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    try {
      bool isSupported = await auth.isDeviceSupported();
      supportState = isSupported;
      update();
    } catch (e) {
      ErrorDialog(errorMessage: e.toString());
    }
  }

  Future<void> authentication() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: LangKeys.VERIFY_IDENTITY_TO_ACCESS,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      authenticated
          ? Get.offAll(() => const HomeScreen())
          : Get.snackbar(LangKeys.AUTH_FAILED, LangKeys.AUTH_FAILED,
              backgroundColor: Colors.white);
    } catch (e) {
      ErrorDialog(errorMessage: e.toString());
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
      bool supportState = await auth.isDeviceSupported();
      supportState == false
          ? Get.snackbar(
              LangKeys.INFO, LangKeys.BIOMETRIC_SUPPORT_IS_NOT_AVAILABLE)
          : null;
    } catch (e) {
      ErrorDialog(errorMessage: e.toString());
    }
  }
}
