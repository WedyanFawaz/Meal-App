import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class favoriteMealsNotifier extends StateNotifier<List<Meal>> {
//It should has A, B
//A = The inital state of the list
// B all the differents methods that used to change the data

  favoriteMealsNotifier() : super([]); //Inital data

  bool toggleMealFavoriteStates(Meal meal) {
//We can't use add or .remove because I can't add to memory, instead I can replace the list itself

    final mealFavorite = state.contains(meal);
    if (mealFavorite) {
      state = state.where((m) => m.id != meal.id).toList(); //remove the meal
      return false;
    } else {
      state = [
        ...state,
        meal

      ]; 
      return true;// pull out all the exting meals and add meal to it
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<favoriteMealsNotifier, List<Meal>>(
        (ref) => favoriteMealsNotifier());
