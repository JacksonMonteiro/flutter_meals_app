import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);

    final availableHeight = mQuery.size.height - mQuery.padding.top;

    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: mQuery.size.width * 0.5,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: mQuery.size.width * 0.025,
        mainAxisSpacing: (availableHeight) * 0.025,
      ),
      children: dummyCategories
          .map((category) => CategoryItem(category: category))
          .toList(),
    );
  }
}
