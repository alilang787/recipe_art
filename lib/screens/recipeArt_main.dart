import 'package:flutter/material.dart';
import 'package:recipe_art/widgets/drawer.dart';
import 'package:recipe_art/widgets/recipe%20main/favourites_recipes.dart';
import 'package:recipe_art/widgets/recipe%20main/recipe_categories.dart';

class RecipeArt extends StatefulWidget {
  const RecipeArt({super.key});

  @override
  State<RecipeArt> createState() => _RecipeArtState();
}

class _RecipeArtState extends State<RecipeArt> {
  int tap_val = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(tap_val == 0 ? 'CATEGORIES' : 'FAVOURITES'),
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        drawer: DrawerMain(),
        body: TabBarView(children: [
          RecipeCategories(),
          FavouriteRecipes(),
        ]),
        bottomNavigationBar: Container(
          // height: 60,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 5,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          child: TabBar(
            onTap: (val) {
              setState(() {
                tap_val = val;
              });
            },
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Theme.of(context).colorScheme.onPrimaryContainer,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            unselectedLabelColor:
                Theme.of(context).colorScheme.onPrimaryContainer,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            labelPadding: EdgeInsets.all(4),
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.category),
                    SizedBox(width: 6),
                    Text(tap_val == 0 ? 'Categories' : '')
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 6),
                    Text(tap_val == 1 ? 'Favorite' : '')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
