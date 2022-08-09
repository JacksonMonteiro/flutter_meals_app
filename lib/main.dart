import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/views/categories_meals_view.dart';
import 'package:meals/views/favorite_view.dart';
import 'package:meals/views/meal_detail_view.dart';
import 'package:meals/views/settings_view.dart';
import 'package:meals/views/tabs_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos cozinhar',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
          secondary: Colors.greenAccent,
        ),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const TabsView(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsView(),
        AppRoutes.mealDetail: (context) => const MealDetailView(),
        AppRoutes.settings: (context) => const SettingsView(),
      },
    );
  }
}
