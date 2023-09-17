import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/core/app-colors/palette.dart';

Widget appBarTitle() {
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

Widget createNewTask() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.only(
          left: 25.0,
          top: 25.0,
        ),
        child: Text(
          'Add Task',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 16.0,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0.0, 26.0, 0.0),
        child: TextField(
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Task Title',
            hintStyle: TextStyle(
              color: hintFontColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: fieldBordersColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: fieldBordersColor,
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
          autofocus: true,
        ),
      ),
      const SizedBox(
        height: 12.0,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0.0, 26.0, 0.0),
        child: TextField(
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Description',
            hintStyle: TextStyle(
              color: hintFontColor,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/timer-icon.svg',
                  width: 24.0,
                  height: 24.0,
                ),
                onPressed: () {
                  //TODO
                },
                color: Colors.white,
              ),
              const SizedBox(
                width: 16.0,
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/tag-icon.svg',
                  width: 24.0,
                  height: 24.0,
                ),
                onPressed: () {
                  //TODO
                },
                color: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/send-icon.svg',
              width: 24.0,
              height: 24.0,
            ),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
    ],
  );
}
