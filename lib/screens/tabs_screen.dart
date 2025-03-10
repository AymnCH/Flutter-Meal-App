import 'package:app04/models/meal.dart';
import 'package:app04/providers/favorite_provider.dart';

import 'package:app04/screens/categories_screen.dart';
import 'package:app04/screens/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    var activePageTitle = 'Pick your category';
    if (_selectedPageIndex == 1) {
      final List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        title: '',
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Categories'),
              onTap: () {
                Navigator.of(context).pop();
                _selectPage(0);
              },
            ),
            ListTile(
              title: Text('Favorites'),
              onTap: () {
                Navigator.of(context).pop();
                _selectPage(1);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
