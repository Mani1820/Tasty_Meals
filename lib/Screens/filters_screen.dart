import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegan;
  late bool isVegetarian;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filterProviders);
    isGlutenFree = activeFilters[Filter.glutenFree]!;
    isLactoseFree = activeFilters[Filter.lactoseFree]!;
    isVegan = activeFilters[Filter.vegan]!;
    isVegetarian = activeFilters[Filter.vegetarian]!;
  }

  void _setFilter(Filter filter, bool value) {
    setState(() {
      switch (filter) {
        case Filter.glutenFree:
          isGlutenFree = value;
          break;
        case Filter.lactoseFree:
          isLactoseFree = value;
          break;
        case Filter.vegan:
          isVegan = value;
          break;
        case Filter.vegetarian:
          isVegetarian = value;
          break;
      }
    });
    ref.read(filterProviders.notifier).setFilter({
      Filter.glutenFree: isGlutenFree,
      Filter.lactoseFree: isLactoseFree,
      Filter.vegan: isVegan,
      Filter.vegetarian: isVegetarian,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Gluten-free'),
            value: isGlutenFree,
            onChanged: (value) => _setFilter(Filter.glutenFree, value),
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            value: isLactoseFree,
            onChanged: (value) => _setFilter(Filter.lactoseFree, value),
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            value: isVegan,
            onChanged: (value) => _setFilter(Filter.vegan, value),
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            value: isVegetarian,
            onChanged: (value) => _setFilter(Filter.vegetarian, value),
          ),
        ],
      ),
    );
  }
}