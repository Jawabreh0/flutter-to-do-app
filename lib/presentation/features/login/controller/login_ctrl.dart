// login_ctrl.dart

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/mixins/snackbar_mixin.dart';
import 'package:todo/presentation/features/home/screen/home_screen.dart';

class LoginController extends GetxController with SnackbarMixin {
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
      e.printError();
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

      if (authenticated) {
        showSnackbar(LangKeys.SUCCESS, LangKeys.AUTHENTICATED_USER);
        Get.offAll(() => const HomeScreen());
      } else {
        showSnackbar(LangKeys.AUTH_FAILED, LangKeys.AUTHENTICATED_USER);
      }
    } on PlatformException catch (e) {
      showSnackbar(LangKeys.PLATFORM_EXCEPTION, "$e");
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
      bool supportState = await auth.isDeviceSupported();
      if (supportState) {
        showSnackbar(LangKeys.INFO, LangKeys.SUPPORTED_DEVICE);
      } else {
        showSnackbar(
            LangKeys.INFO, LangKeys.BIOMETRIC_SUPPORT_IS_NOT_AVAILABLE);
      }
    } catch (e) {
      showSnackbar(LangKeys.ERROR, "$e");
    }
  }
}
