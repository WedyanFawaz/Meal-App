import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Details_Meal.dart';
import 'package:meals_app/widget/Meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFav});
  final String? title;
  final List<Meal> meals;
final void Function (Meal meal) onToggleFav;



  @override
  Widget build(BuildContext context) {
  Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

if (title ==null){
  return content;
}

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: meals.isEmpty
            ? content
            : ListView.builder(
              itemCount: meals.length,
                itemBuilder: (ctx, index) => MealItem(meal: meals[index], onToggleFav: onToggleFav,)));
  }
}
