import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/models/recipe_models.dart';
import 'package:recipe_art/providers/filter_provider.dart';
import 'package:recipe_art/widgets/recipe_intro.dart';


class RecipeItems extends ConsumerWidget {
  RecipeItems({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe_items_filtered = ref.watch(filterd_recipes_provider);

    final List<RecipeModel> category_items = recipe_items_filtered
        .where((recipe) => recipe.categories.contains(category.category))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.category_name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: category_items.length,
            itemBuilder: (context, index) {
              final item = category_items[index];
              return RecipeIntro(
                item: item,
                placeholder: category.category_icon,
              );
            }),
      ),
    );
  }
}
