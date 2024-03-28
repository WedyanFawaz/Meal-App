import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Meals.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filters.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widget/main_drawer.dart';

const kIntialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetrain: false,
  Filter.vegan: false
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kIntialFilter;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifer) async {
    if (identifer == 'Filters') {
      Navigator.pop(context);
      //pushReplacement REPLACE the old screen instead of push another one in front of it
      final result = await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters:_selectedFilters,)));
      setState(() {
        _selectedFilters = result ?? kIntialFilter;
      });
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteMealState(Meal meal) {
    final isExiting = _favoriteMeals.contains(meal);

    if (isExiting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Deleted Successfully');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Added Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetrain]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = categoriesScreen(
      availableMeals: availableMeals,
      onToggleFav: _toggleFavoriteMealState,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        title: '',
        meals: _favoriteMeals,
        onToggleFav: _toggleFavoriteMealState,
      );
    }
    activePageTitle = 'Your Favorites';
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
        onTap: _selectedPage, // This should call _selectedPage function
      ),
    );
  }
}
