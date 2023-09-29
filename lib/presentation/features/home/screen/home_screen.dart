import 'package:flutter/material.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/home/widgets/bottom_sheet_widget.dart';
import 'package:todo/presentation/features/home/widgets/empty_screen_widgets.dart';
import 'package:todo/presentation/features/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const HomeAppBar(),
      ),
      backgroundColor: appColor,
      body: const EmptyHomeScreenWidgets(),
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
              child: const BottomSheetWidgets(),
            ),
            backgroundColor: bottomSheetColor,
          );
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
