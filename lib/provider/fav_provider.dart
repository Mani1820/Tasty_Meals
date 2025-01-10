import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Models/meal.dart';

class FavProvider extends StateNotifier<List<Meal>> {
  FavProvider() : super([]);

  bool toggleFavorite(Meal meal) {
    final isFavoriteMeals = state.contains(meal);

    if (isFavoriteMeals) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favMealsProvider = StateNotifierProvider<FavProvider, List<Meal>>((ref) {
  return FavProvider();
});
