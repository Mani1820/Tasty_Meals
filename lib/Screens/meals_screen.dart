// ignore_for_file: collection_methods_unrelated_type
import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';
import 'package:meals_app/Widgets/meal_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItems(
              meal: meals[index],
              onSelectedMeal: selectedMeal,
            ));
    if (meals.isEmpty) {
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No meals for this category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Try a different category!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
