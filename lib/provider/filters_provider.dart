import 'package:flutter_riverpod/flutter_riverpod.dart';

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
