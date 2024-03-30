import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Meals.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widget/category_grid_item.dart';

class categoriesScreen extends StatefulWidget {
  const categoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward(); // Make the animation show
  }

  @override
  void dispose() {
    _animationController
        .dispose(); //Remove any animation from memory to avoid overhead
    super.dispose();
  }

  void _selectCategory(context, Category category) {
    List<Meal> MealsOfCategory = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    //It push the route to the top on the screen stack, in case of pop it remove the current screen
    //Navigator.of(context).push(route); // It another way to write the same code
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MealsScreen(
                title: category.title,
                meals: MealsOfCategory)))); // it must return widget
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //child =
      builder: (context, child) => SlideTransition(
        position: Tween(begin: const Offset(1, 0.3), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
        child: child,
      ),
      animation: _animationController,
      child:
          //Number of columns , size of each one
          GridView(
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
