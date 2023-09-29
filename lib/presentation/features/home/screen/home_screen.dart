// Clean

import 'package:flutter/material.dart';
import 'package:todo/presentation/features/home/widgets/empty_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: EmptyHomeWidget.emptyHomeBody(),
    );
  }
}
