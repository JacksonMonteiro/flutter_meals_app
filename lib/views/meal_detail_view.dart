import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/models/meal.dart';

class MealDetailView extends StatelessWidget {
  const MealDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    final MediaQueryData mQuery = MediaQuery.of(context);

    AppBar appBar = AppBar(
      title: Text(
        meal.title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    final double availableHeight =
        mQuery.size.height - appBar.preferredSize.height - mQuery.padding.top;

    Container _createSectionTitle(BuildContext context, String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    Container _createSectionContainer(Widget child) {
      return Container(
        width: mQuery.size.width,
        height: availableHeight * 0.35,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        child: child,
      );
    }

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: availableHeight * 0.3,
                width: mQuery.size.width,
                child: Image.network(meal.imageUrl, fit: BoxFit.cover),
              ),
              Center(child: _createSectionTitle(context, 'Ingredients')),
              _createSectionContainer(
                ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context, index) => Card(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(meal.ingredients[index]),
                          ),
                        )),
              ),
              Center(child: _createSectionTitle(context, 'Steps')),
              _createSectionContainer(
                ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('${index + 1}'),
                              ),
                              title: Text(meal.steps[index]),
                            ),
                            const Divider(),
                          ],
                        )),
              )
            ],
          ),
        ));
  }
}
