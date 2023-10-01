import 'package:flutter/material.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/category/widgets/category_widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Create new category"),
          backgroundColor: appColor,
          elevation: 0),
      backgroundColor: appColor,
      body: CategoryWidgets(),
    );
  }
}
