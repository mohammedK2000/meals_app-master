import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>? favoriteMeals;
  const FavoriteScreen({Key? key, this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - Start Adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals![index].id,
            affordability: favoriteMeals![index].affordability,
            complexity: favoriteMeals![index].complexity,
            duration: favoriteMeals![index].duration,
            imageUrl: favoriteMeals![index].imageUrl,
            title: favoriteMeals![index].title,
          );
        },
        itemCount: favoriteMeals!.length,
      );
    }
  }
}
