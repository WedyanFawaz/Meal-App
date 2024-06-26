import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetrain, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          //Inital data
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetrain: false,
          Filter.vegan: false,
        });

void setFilters(Map<Filter,bool> chosenFilter){
  state = chosenFilter;
}
  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final filterMealsProvider = Provider((ref) {
  
 final meals= ref.watch(mealsProvider);
 final activeFilters = ref.watch(filterProvider);
 return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetrain]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
}
    );