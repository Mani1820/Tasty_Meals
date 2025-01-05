import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Models/categories.dart';
import 'package:meals_app/Screens/meals_screen.dart';
import 'package:meals_app/Widgets/category_grid_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Categories categories) {
    final filteredMeals = dummyMeals
        .where((meals) => meals.categories.contains(categories.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: categories.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final categories in availableCategories)
          CategoriesGridItems(
              categories: categories,
              onSelectCategory: () {
                _selectCategory(context, categories);
              }),
      ],
    );
  }
}
