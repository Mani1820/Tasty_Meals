import 'package:flutter/material.dart';
import 'package:meals_app/Screens/catagories_screen.dart';
import 'package:meals_app/Screens/meals_screen.dart';

class Tabsscreen extends StatefulWidget {
  const Tabsscreen({super.key});

  @override
  State<Tabsscreen> createState() => _TabsscreenState();
}

class _TabsscreenState extends State<Tabsscreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String activePageTitle = 'Categories';

    Widget activePage = CategoriesScreen();

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: []);
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
