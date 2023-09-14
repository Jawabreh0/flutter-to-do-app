import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:to_do/presentation/features/home/screen/empty_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
      ),
      backgroundColor: appColor,
      body: buildBody(),
      bottomNavigationBar: buildBottomButton(),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/imgs/in-app-logo.png'),
              if (_supportState)
                const Text('This device supports biometric authintication')
              else
                const Text(
                    'This device is not support biometric authintication')
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75.0, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          _authentication();
          _getAvailableBiometrics();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appSecendoryColor,
          minimumSize: const Size.fromHeight(45),
        ),
        child: const Text(
          'Unlock App',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 1.505,
          ),
        ),
      ),
    );
  }

  Future<void> _authentication() async {
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
        Get.to(const EmptyHomeScreen());
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    await auth.getAvailableBiometrics();

    if (!mounted) {
      return;
    }
  }
}
