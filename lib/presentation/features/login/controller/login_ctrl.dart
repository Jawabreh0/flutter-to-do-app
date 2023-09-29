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
    bool isSupported = await auth.isDeviceSupported();
    supportState = isSupported;
    update();
  }

  Future<void> authentication() async {
    bool authenticated = await auth.authenticate(
      localizedReason: LangKeys.VERIFY_IDENTITY_TO_ACCESS,
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );
    authenticated
        ? Get.offAll(() => const HomeScreen())
        : showSnackbar(LangKeys.AUTH_FAILED, LangKeys.AUTH_FAILED);
  }

  Future<void> getAvailableBiometrics() async {
    await auth.getAvailableBiometrics();
    bool supportState = await auth.isDeviceSupported();
    supportState == false
        ? showSnackbar(
            LangKeys.INFO, LangKeys.BIOMETRIC_SUPPORT_IS_NOT_AVAILABLE)
        : null;
  }
}
