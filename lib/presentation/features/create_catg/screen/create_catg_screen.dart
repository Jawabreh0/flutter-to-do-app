import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';
import '../widgets/create_catg_widgets.dart';

class CreateCatgScreen extends StatelessWidget {
  const CreateCatgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          title: const Text(
            "Create new category",
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
        body: CreateCatgWidget.createCatgBody());
  }
}
