import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/screens/filter_screen.dart';
import 'package:recipe_art/screens/recipeArt_main.dart';

void main() {
  runApp(Main());
}

class routes {
  static const home = '/home';
  static const filters_screen = '/filters_screen';
  static const show_recipe_category_items = '\show_recipe_category_items';
}

class Main extends StatefulWidget {
  Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final kColorSchemeLight = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  // bool isGlutenFree = false;
  // bool isVegan = false;
  // bool isVegetarian = false;
  // bool isLactoseFree = false;
  // void filter_vals({bool? glu, bool? lac, bool? vegan, bool? vege}) {
  //   if (glu != null) isGlutenFree = glu;
  //   if (lac != null) isLactoseFree = lac;
  //   if (vegan != null) isVegan = vegan;
  //   if (vege != null) isVegetarian = vege;
  // }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: kColorSchemeLight,
          appBarTheme: AppBarTheme().copyWith(
            color: kColorSchemeLight.onPrimaryContainer,
            foregroundColor: Colors.white,
          ),
        ),
        title: 'RecipeArt',
        routes: {
          routes.home: (context) => RecipeArt(),
          routes.filters_screen: (context) => FilterScreen(),
        },
        home: RecipeArt(),
      ),
    );
  }
}
