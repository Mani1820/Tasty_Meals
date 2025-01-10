import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/catagories_screen.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meals_screen.dart';
import 'package:meals_app/Widgets/drawer.dart';
import 'package:meals_app/provider/provider.dart';
import 'package:meals_app/provider/fav_provider.dart';
import 'package:meals_app/provider/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class Tabsscreen extends ConsumerStatefulWidget {
  const Tabsscreen({super.key});

  @override
  ConsumerState<Tabsscreen> createState() => _TabsscreenState();
}

class _TabsscreenState extends ConsumerState<Tabsscreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(identifiers) async {
    Navigator.of(context).pop();
    if (identifiers == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final actualMeals = ref.watch(mealsProvider);
    final selectedFilters = ref.watch(filterProviders);
    final availableMeals = actualMeals.where((Meal meal) {
      if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    String activePageTitle = 'Categories';

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      final favoritemeals = ref.watch(favMealsProvider);
      activePage = MealsScreen(
        meals: favoritemeals,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
