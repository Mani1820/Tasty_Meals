import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifiers) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onTap: () {
              onSelectScreen('Meals');
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onTap: () {
              onSelectScreen('Filters');
            },
          ),
        ],
      ),
    );
  }
}
