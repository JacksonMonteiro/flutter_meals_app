import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsView extends StatelessWidget {
  const CategoriesMealsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
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
        itemBuilder: (context, index) => Text(categoryMeals[index].title),
      ),
    );
  }
}
