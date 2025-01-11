import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/fav_provider.dart';
import 'package:meals_app/Models/meal.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favProvider = ref.watch(favMealsProvider);
    final isAdded = favProvider.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasMealAdded =
                  ref.read(favMealsProvider.notifier).toggleFavorite(meal);

              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasMealAdded
                      ? 'Meal added to favorites!'
                      : 'Meal removed from favorites!'),
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            icon: Icon(isAdded ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            Text(
              'ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
            const SizedBox(
              height: 28,
            ),
            Text(
              'steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 3,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
