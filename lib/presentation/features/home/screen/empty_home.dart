import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';
import '../widget/home_widgets.dart';

class EmptyHomeScreen extends StatefulWidget {
  const EmptyHomeScreen({super.key});

  @override
  createState() {
    return EmptyHomeState();
  }
}

class EmptyHomeState extends State<EmptyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          titleSpacing: 24.0,
          elevation: 0,
          title: appBarTitle(),
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
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ));
  }
}
