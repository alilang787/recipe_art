import 'package:flutter/material.dart';

class Ingredients extends StatefulWidget {
  Ingredients({super.key, required this.ingredients});
  final List<String> ingredients;

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          child: child,
          position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.bounceOut)),
        );
      },
      child: ListView.builder(
        itemCount: widget.ingredients.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.ingredients[index],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Divider(
                thickness: 1,
                height: 32,
              ),
            ],
          );
        },
      ),
    );
  }
}
