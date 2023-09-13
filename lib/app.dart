import 'package:to_do/presentation/features/home/screen/empty_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EmptyHomeScreen(),
      ),
    );
  }
}
