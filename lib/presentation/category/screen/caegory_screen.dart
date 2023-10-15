import 'package:flutter/material.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/category/widget/category_widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(LangKeys.CREATE_CATEGORY),
          backgroundColor: appColor,
          elevation: 0),
      backgroundColor: appColor,
      body: CategoryWidgets(),
    );
  }
}
