import 'package:flutter/material.dart';
import 'package:meals_app/widget/Meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),body: meals.isEmpty? Text('No meals'):
    GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),children: [
      for (final meal in meals )
      MealItem(meal: meal)
    ],)
    );
  }
}
