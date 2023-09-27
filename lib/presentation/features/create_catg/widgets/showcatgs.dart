import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/create_catg/controller/catg_ctrl.dart'; // Import your controller class

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  CategoryListWidgetState createState() => CategoryListWidgetState();
}

class CategoryListWidgetState extends State<CategoryListWidget> {
  final CatgController controller = Get.put(CatgController());

  @override
  void initState() {
    super.initState();
    controller
        .fetchCategories(); // Fetch categories when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
      ),
      body: Obx(
        () {
          final categories =
              controller.categories; // Use the correct property name
          if (categories.isEmpty) {
            return const Center(
              child: Text('No categories found.'),
            );
          } else {
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  leading: Icon(
                    category.catgIcon,
                    color: category.catgColor,
                  ),
                  title: Text(category.catgName),
                );
              },
            );
          }
        },
      ),
    );
  }
}
