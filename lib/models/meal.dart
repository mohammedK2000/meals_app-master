import 'package:flutter/foundation.dart';

enum Complexity { simple, challenging, hard }
enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String? id;
  final List<String>? categories;
  final String? title;
  final List<String>? ingredients;
  final String? imageUrl;
  final List<String>? steps; // what have to do to make the meal
  final int? duration; // how long time should take this meal
  final Complexity? complexity;
  final Affordability? affordability;
  final bool? isGlutenFree;
  final bool? isLactoseFree;
  final bool? isVegan;
  final bool? isVegetarian;
  final Function()? removeItem;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.title,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.removeItem});
}
