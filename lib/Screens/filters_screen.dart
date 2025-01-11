import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProviders);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Gluten-free'),
            subtitle: Text('Only include gluten-free meals'),
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked){
              ref.read(filterProviders.notifier).setFilters(Filter.glutenFree, isChecked);
            },
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            subtitle: Text('Only include lactose-free meals'),
            value: filters[Filter.lactoseFree]!,
            onChanged: (isChecked){
              ref.read(filterProviders.notifier).setFilters(Filter.lactoseFree, isChecked);
            },
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: Text('Only include vegan meals'),
            value: filters[Filter.vegan]!,
            onChanged: (isChecked){
              ref.read(filterProviders.notifier).setFilters(Filter.vegan, isChecked);
            },
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: Text('Only include vegetarian meals'),
            value: filters[Filter.vegetarian]!,
            onChanged: (isCkecked){ 
              ref.read(filterProviders.notifier).setFilters(Filter.vegetarian, isCkecked);
            },
          ),
        ],
      ),
    );
  }
}