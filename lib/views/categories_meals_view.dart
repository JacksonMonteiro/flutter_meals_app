import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsView extends StatelessWidget {
  final Category category;

  const CategoriesMealsView({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text('Receitas por categoria'),
      ),
    );
  }
}
