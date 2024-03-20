import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widget/category_grid_item.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      )
      //Number of columns , size of each one
      ,
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        children: [
          for (final category in availableCategories)
          CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
