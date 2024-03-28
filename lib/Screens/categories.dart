import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Meals.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widget/category_grid_item.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({super.key, required this.onToggleFav, required this.availableMeals});
final void Function (Meal meal) onToggleFav;
final List<Meal> availableMeals;
  void _selectCategory(context, Category category) {
    List<Meal> MealsOfCategory = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
        

    //It push the route to the top on the screen stack, in case of pop it remove the current screen
    //Navigator.of(context).push(route); // It another way to write the same code
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MealsScreen(
                title: category.title,
                meals: MealsOfCategory, onToggleFav: onToggleFav,)))); // it must return widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Number of columns , size of each one
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
