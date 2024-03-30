import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Screens/Meals.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filters.dart';

import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widget/main_drawer.dart';

import '../providers/filter_provider.dart';



class TabScreen extends ConsumerStatefulWidget { //Stateful 
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifer) async {
    if (identifer == 'Filters') {
      Navigator.pop(context);
      //pushReplacement REPLACE the old screen instead of push another one in front of it
      await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
//read to take the elemnts from provider once
//watch to set up listener to check the change
final availableMeals = ref.watch(filterMealsProvider);
    Widget activePage = categoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        title: '',
        meals: favoriteMeals,
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
