import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/models/recipe_models.dart';
import 'package:recipe_art/providers/favourite_provider.dart';
import 'package:recipe_art/widgets/recipe%20item%20details/ingredients.dart';
import 'package:recipe_art/widgets/recipe%20item%20details/specs.dart';
import 'package:recipe_art/widgets/recipe%20item%20details/steps.dart';

class RecipeItemDetails extends ConsumerStatefulWidget {
  final Widget image;
  final RecipeModel recipe;
  RecipeItemDetails({
    super.key,
    required this.image,
    required this.recipe,
  });

  @override
  ConsumerState<RecipeItemDetails> createState() => _RecipeItemDetailsState();
}

class _RecipeItemDetailsState extends ConsumerState<RecipeItemDetails>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favourite_recipes = ref.watch(favourites_provider);

    final bool _isFav = favourite_recipes.contains(widget.recipe);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(children: [
              Hero(
                tag: widget.recipe.title,
                child: widget.image,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      radius: 16,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          String.fromCharCode(Icons.close.codePoint),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            fontFamily: Icons.close.fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      widget.recipe.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    // _animationController.reset();
                    // _animationController.forward();

                    return ref
                        .read(favourites_provider.notifier)
                        .toggleFavourites(widget.recipe);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: _isFav ? Colors.black : Colors.white,
                      border: Border.all(
                        width: 3,
                        color: _isFav ? Colors.black : Colors.grey,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Transform(
                              child: child,
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..rotateY(animation.value * 3.14),
                            );
                          },
                          child: child,
                        );
                      },
                      child: Center(
                        key: ValueKey(_isFav),
                        child: Icon(
                          Icons.favorite,
                          color: _isFav ? Colors.white : Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 4,
            color: Colors.green,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Container(
                color: Colors.deepPurple.withOpacity(0),
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.deepPurple,
                      dividerHeight: 5,
                      dividerColor: Colors.deepPurple,
                      indicator: BoxDecoration(
                        border: Border.all(
                          width: 0,
                        ),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12)),
                        color: Colors.deepPurple,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      // padding: EdgeInsets.symmetric(horizontal: 12),
                      indicatorPadding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                      labelPadding: EdgeInsets.only(top: 8),
                      tabs: [
                        Tab(
                          text: 'INGREDIENTS',
                        ),
                        Tab(
                          text: 'STEPS',
                        ),
                        Tab(
                          text: 'SPECs',
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 44,
                          vertical: 8,
                        ),
                        child: TabBarView(children: [
                          Center(
                            child: Ingredients(
                              key: ValueKey(widget.recipe.ingredients),
                              ingredients: widget.recipe.ingredients,
                            ),
                          ),
                          Steps(steps: widget.recipe.steps),
                          Specs(
                            isglu: widget.recipe.isGlutenFree,
                            islac: widget.recipe.isLactoseFree,
                            isvege: widget.recipe.isVegetarian,
                            isvegan: widget.recipe.isVegan,
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
