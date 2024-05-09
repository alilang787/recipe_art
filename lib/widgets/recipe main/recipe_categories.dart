

import 'package:flutter/material.dart';
import 'package:recipe_art/data/cactegories_data.dart';
import 'package:recipe_art/screens/recipe_items_screen.dart';
import 'package:recipe_art/widgets/category_card.dart';

class RecipeCategories extends StatefulWidget {
  const RecipeCategories({
    super.key,
  });

  @override
  State<RecipeCategories> createState() => _RecipeCategoriesState();
}

class _RecipeCategoriesState extends State<RecipeCategories> {
  @override
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // controller: _scrollController,
      padding: EdgeInsets.all(12),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: recipe_categories.length,
      itemBuilder: (context, index) {
        final category = recipe_categories[index % recipe_categories.length];

        return InkWell(
          radius: 40,
          onTap: () => Navigator.of(context).push(
           MaterialPageRoute(builder: (context) {
             return RecipeItems(
              category: category,
             );
           },) 
          ),
          child: CategoryCard(category: category),
        );
      },
    );
  }
}
