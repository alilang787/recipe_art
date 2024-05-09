import 'package:flutter/material.dart';
import 'package:recipe_art/models/recipe_models.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.purple.shade50,
      elevation: 2,
      margin: EdgeInsets.all(12),
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.all(constraints.maxHeight * 0.05),
          child: Column(
            children: [
              Image.asset(
                category.category_icon,
                height: constraints.maxHeight * 0.7,
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    category.category_name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
