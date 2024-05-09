// import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/data/recipies_data.dart';


final recipes_provider = Provider(
  (ref) {
    return RecipesData;
  },
);
