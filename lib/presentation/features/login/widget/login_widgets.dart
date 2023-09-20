import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';

class LoginWidgets {
  static Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/imgs/in-app-logo.png'),
            ],
          ),
        ),
      ],
    );
  }

  static Widget buildBottomButton(
      Function authentication, Function getAvailableBiometrics) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75.0, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          authentication();
          getAvailableBiometrics();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appSecondaryColor,
          minimumSize: const Size.fromHeight(45),
        ),
        child: const Text(
          'Unlock App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 1.505,
          ),
        ),
      ),
    );
  }
}
