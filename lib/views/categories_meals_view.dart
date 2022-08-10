import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsView extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsView({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();
    // final MediaQueryData mQuery = MediaQuery.of(context);

    AppBar appBar = AppBar(
      title: Text(
        category.title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    // final double availableHeight =
    //     mQuery.size.height - appBar.preferredSize.height - mQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) =>
              MealItem(meal: categoryMeals[index])),
    );
  }
}
