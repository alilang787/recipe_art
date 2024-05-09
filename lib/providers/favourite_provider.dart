import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/models/recipe_models.dart';

class FavouritesNotifire extends StateNotifier<List<RecipeModel>> {
  FavouritesNotifire() : super([]);

  void toggleFavourites(RecipeModel recipe) {
    bool isFav = state.contains(recipe);
    if (isFav) {
      state = state.where((e) => e != recipe).toList();
    } else {
      state = [...state, recipe];
    }
  }
}

final favourites_provider =
    StateNotifierProvider<FavouritesNotifire, List<RecipeModel>>((ref) {
  return FavouritesNotifire();
});
