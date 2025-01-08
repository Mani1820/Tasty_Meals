import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;

  const FiltersScreen({super.key, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegan;
  late bool isVegetarian;

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.currentFilters[Filter.glutenFree]!;
    isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    isVegan = widget.currentFilters[Filter.vegan]!;
    isVegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pop({
                Filter.glutenFree: isGlutenFree,
                Filter.lactoseFree: isLactoseFree,
                Filter.vegetarian: isVegetarian,
                Filter.vegan: isVegan,
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: isGlutenFree,
            onChanged: (onChecked) {
              setState(() {
                isGlutenFree = onChecked;
              });
            },
            title: Text(
              'Gluten Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include gluten free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.only(left: 36, right: 22),
          ),
          SwitchListTile(
            value: isLactoseFree,
            onChanged: (onChecked) {
              setState(() {
                isLactoseFree = onChecked;
              });
            },
            title: Text(
              'Lactose Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include lactose free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.only(left: 36, right: 22),
          ),
          SwitchListTile(
            value: isVegan,
            onChanged: (onChecked) {
              setState(() {
                isVegan = onChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.only(left: 36, right: 22),
          ),
          SwitchListTile(
            value: isVegetarian,
            onChanged: (onChecked) {
              setState(() {
                isVegetarian = onChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.only(left: 36, right: 22),
          ),
        ],
      ),
    );
  }
}