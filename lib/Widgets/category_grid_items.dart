// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meals_app/Models/categories.dart';
import 'package:meals_app/main.dart';

class CategoriesGridItems extends StatelessWidget {
  const CategoriesGridItems(
      {super.key, required this.categories, required this.onSelectCategory});

  final Categories categories;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onSelectCategory,
      splashColor: theme.colorScheme.background,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              categories.color.withOpacity(0.55),
              categories.color.withOpacity(0.90),
            ],
          ),
        ),
        child: Text(
          categories.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.surfaceBright),
        ),
      ),
    );
  }
}
