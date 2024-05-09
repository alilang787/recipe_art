import 'package:flutter/material.dart';
import 'package:recipe_art/models/recipe_models.dart';
import 'package:recipe_art/screens/recipe_item_details_screen.dart';

class RecipeIntro extends StatelessWidget {
  const RecipeIntro({super.key, required this.item, required this.placeholder});

  final RecipeModel item;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    final image = FadeInImage(
      placeholder: AssetImage(placeholder),
      placeholderFit: BoxFit.contain,
      image: NetworkImage(item.imageUrl),
      height: double.maxFinite,
      width: double.maxFinite,
      fit: BoxFit.cover,
      imageErrorBuilder: (context, error, stackTrace) {
        return Center(
          child: Text(
            'Error Loading Image',
            style: TextStyle(
                color: Colors.grey.shade700.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return RecipeItemDetails(
                image: image,
                recipe: item,
              );
            },
          ));
        },
        child: SizedBox(
          height: 300,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(children: [
              Hero(
                tag: item.title,
                child: image,
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: SizedBox(
                  height: 70,
                  child: Card(
                    elevation: 2,
                    // surfaceTintColor: Colors.white,
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 8, color: Colors.black
                              // Theme.of(context)
                              //     .colorScheme
                              //     .onPrimaryContainer,
                              ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text(
                              item.title,
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
