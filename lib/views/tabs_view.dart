import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/categories_view.dart';
import 'package:meals/views/favorite_view.dart';

class TabsView extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsView({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;
  late List<Map<String, Object>> _views;

  @override
  void initState() {
    super.initState();
    _views = [
      {
        'title': 'Lista de categorias',
        'view': const CategoriesView(),
      },
      {
        'title': 'Meus Favoritos',
        'view': FavoriteView(
          favoriteMeals: widget.favoriteMeals,
        ),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    // final mQuery = MediaQuery.of(context);

    // final availableHeight =
    //     mQuery.size.height - appBar.preferredSize.height - mQuery.padding.top;

    _selectView(int index) {
      setState(() {
        _selectedViewIndex = index;
      });
    }

    AppBar appBar = AppBar(
      title: Text(
        _views[_selectedViewIndex]['title'] as String,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    return Scaffold(
      appBar: appBar,
      drawer: const MainDrawer(),
      body: _views[_selectedViewIndex]['view'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectView,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedViewIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
