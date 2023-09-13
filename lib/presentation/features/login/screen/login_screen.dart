import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            children: [
              Image.asset('assets/imgs/in-app-logo.png'),
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
          // TODO
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
}
