import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(meal.title),
    );
  }
}