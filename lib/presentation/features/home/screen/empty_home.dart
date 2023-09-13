import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/core/app-colors/palette.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        titleSpacing: 24.0,
        elevation: 0,
        title: _appBarTitle(),
      ),
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emptyHomeImage(),
              emptyHomeMainText(),
              emptyHomeSecText()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appSecendoryColor,
        onPressed: () {
          //TODO
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  Widget _appBarTitle() {
    return Row(
      children: [
        const Text(
          'Task 0',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        const Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/icons/calendar.svg',
          width: 24.0,
          height: 24.0,
        ),
      ],
    );
  }
}

Widget emptyHomeImage() {
  return Padding(
    padding: const EdgeInsets.only(top: 90, bottom: 30),
    child: Image.asset('assets/imgs/empty-home.png'),
  );
}

Widget emptyHomeMainText() {
  return const Text(
    'What do you want to do today?',
    style: TextStyle(
      fontFamily: 'Lato',
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5,
      color: Colors.white,
    ),
  );
}

Widget emptyHomeSecText() {
  return const Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: Text(
      'Tap + to add your tasks',
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.5,
        color: Colors.white,
      ),
    ),
  );
}
