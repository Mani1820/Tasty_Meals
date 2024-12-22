// ignore_for_file: collection_methods_unrelated_type
import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No meals for this category",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Try a different category!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
          )
        ],
      ),
    );
    if (meal.isNotEmpty) {
      ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => Text(meal[index].title),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
