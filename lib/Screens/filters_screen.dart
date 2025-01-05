import 'package:flutter/material.dart';
import 'package:meals_app/Screens/tabs_screen.dart';
import 'package:meals_app/Widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;

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
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifiers) {
          if (identifiers == 'Meals') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => Tabsscreen(),
              ),
            );
          }
        },
      ),
      body: Column(
        spacing: 18,
        children: [
          SwitchListTile(
            value: isGlutenFree,
            onChanged: (onChecked) {
              setState(() {
                isGlutenFree = onChecked;
              });
            },
            title: Text(
              'Glutten Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include glutten free meals',
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
              'Only include Vegan meals',
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
              'Vegitarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include Vegitarian meals',
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
