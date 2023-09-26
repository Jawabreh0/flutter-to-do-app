import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/create_catg/widgets/showcatgs.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato', // Set the font family to 'Lato'
      ),
      home: const Scaffold(
        body: CategoryListWidget(),
      ),
    ),
  );
}
