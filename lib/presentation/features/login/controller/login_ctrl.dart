// Clean except the print in the getAvailableBiometrics
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
    bool authenticated = await auth.authenticate(
      localizedReason: "Verify identity to access you're To Do App",
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );

    if (authenticated) {
      Get.offAll(HomeScreen());
    }
  }

  Future<void> getAvailableBiometrics() async {
    await auth.getAvailableBiometrics();
    bool supportState = await auth.isDeviceSupported();
    if (supportState) {
      print('supported');
    } else {
      print('not supported');
    }
  }
}
