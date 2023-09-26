import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/create_catg/controller/catg_ctrl.dart'; // Import your controller class

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({Key? key});

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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of icons per row
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GridTile(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.all(8.0), // Add padding here
                          child: Icon(
                            category.catgIcon,
                            color: category.catgColor,
                          ),
                        ),
                        Text(category.catgName),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
