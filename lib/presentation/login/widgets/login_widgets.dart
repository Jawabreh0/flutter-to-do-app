import 'package:flutter/material.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/bottom_button.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';

class LoginWidgets extends StatelessWidget {
  final Function authentication;
  final Function getAvailableBiometrics;

  const LoginWidgets({
    Key? key,
    required this.authentication,
    required this.getAvailableBiometrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenBody(),
      bottomNavigationBar: CustomBottomButton(
        onPressed: () {
          authentication();
          getAvailableBiometrics();
        },
        buttonText: LangKeys.UNLOCK_APP,
      ),
    );
  }

  Widget screenBody() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildSvgIcon(assetKey: AssetKeys.appLogo),
            ],
          ),
        ),
      ],
    );
  }
}
