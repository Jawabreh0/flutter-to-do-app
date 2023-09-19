import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/create_catg/screen/create_catg_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CreateCatgScreen(),
      ),
    );
  }
}
