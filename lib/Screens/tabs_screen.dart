import 'package:flutter/material.dart';

import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/catagories_screen.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meals_screen.dart';
import 'package:meals_app/Widgets/drawer.dart';

class Tabsscreen extends StatefulWidget {
  const Tabsscreen({super.key});

  @override
  State<Tabsscreen> createState() => _TabsscreenState();
}

class _TabsscreenState extends State<Tabsscreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavorite(Meal meal) {
    final isMealExist = _favoriteMeals.contains(meal);

    if (isMealExist) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal removed from favorites');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal added to favorites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(identifiers) {
    Navigator.of(context).pop();
    if (identifiers == 'Filters') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String activePageTitle = 'Categories';

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavorite,
    );

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
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
