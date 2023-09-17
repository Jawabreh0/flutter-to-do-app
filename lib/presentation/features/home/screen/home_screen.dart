// empty_home_screen.dart
import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';
import '../widget/home_widgets.dart';
import '../controller/home_ctrl.dart';

class EmptyHomeScreen extends StatefulWidget {
  const EmptyHomeScreen({super.key});

  @override
  createState() {
    return EmptyHomeState();
  }
}

class EmptyHomeState extends State<EmptyHomeScreen> {
  final HomeController _controller = HomeController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          backgroundColor: appSecondaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: createNewTask(),
              ),
              backgroundColor: bottomSheetColor,
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ));
  }
}
