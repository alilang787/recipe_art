import 'package:flutter/material.dart';
import 'package:recipe_art/main.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: double.maxFinite,
            height: 180,
            child: SafeArea(
              child: Center(
                child: FittedBox(
                  child: Text(
                    'Preferences',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(routes.home),
            contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
            leading: Icon(Icons.home, size: 35),
            title: Text(
              'home',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(routes.filters_screen),
            contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
            leading: Icon(Icons.filter_alt_sharp, size: 35),
            title: Text(
              'filters',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
