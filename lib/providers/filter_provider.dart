import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/providers/recipies_provider.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegan: false,
          Filters.vegetarian: false,
        });
  void setFilters(Filters filter, bool val) {
    state = {...state, filter: val};
  }
}

final filters_provider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>((ref) {
  return FilterNotifier();
});

final filterd_recipes_provider = Provider((ref) {
  final recipes = ref.watch(recipes_provider);
  final filters = ref.watch(filters_provider);
  return recipes.where((recipe) {
    if (filters[Filters.glutenFree]! && !recipe.isGlutenFree) return false;
    if (filters[Filters.lactoseFree]! && !recipe.isLactoseFree) return false;
    if (filters[Filters.vegan]! && !recipe.isVegan) return false;
    if (filters[Filters.vegetarian]! && !recipe.isVegetarian) return false;
    return true;
  }).toList();
});
