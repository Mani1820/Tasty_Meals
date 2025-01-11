import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/provider/provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilter(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;

  }
  void setFilters(Filter filter, bool isActivated) {
    state = {
      ...state,
      filter: isActivated,
    };
  }
}

final filterProviders =
    StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
        (ref) => FilterProvider());

final filterMealsProvider = Provider<List<Meal>>((ref) {
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
  return availableMeals;
});