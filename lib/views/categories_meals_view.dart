import 'package:flutter/material.dart';

class CategoriesMealsView extends StatelessWidget {
  const CategoriesMealsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final MediaQueryData mQuery = MediaQuery.of(context);

    AppBar appBar = AppBar(
      title: const Text(
        'Receitas',
        style: TextStyle(
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
