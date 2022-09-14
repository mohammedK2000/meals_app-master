import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/CategoryMealsScreen';
  final List<Meal> availableMeals;
  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals![index].id,
            affordability: displayMeals![index].affordability,
            complexity: displayMeals![index].complexity,
            duration: displayMeals![index].duration,
            imageUrl: displayMeals![index].imageUrl,
            title: displayMeals![index].title,
          );
        },
        itemCount: displayMeals!.length,
      ),
    );
  }
}
