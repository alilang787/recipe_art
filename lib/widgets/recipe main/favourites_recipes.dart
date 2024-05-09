import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/providers/favourite_provider.dart';
import 'package:recipe_art/widgets/recipe_intro.dart';

class FavouriteRecipes extends ConsumerWidget {
  FavouriteRecipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favourites_provider);
    return favourites.isEmpty
        ? Center(
            child: Text('No favourites found, Add some!'),
          )
        : Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
                itemCount: favourites.length,
                itemBuilder: (context, index) {
                  final item = favourites[index];

                  return RecipeIntro(
                      item: item,
                      placeholder: 'assets/icons/luancher/recipe.png');
                }),
          );
  }
}
