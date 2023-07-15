import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/side_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabState();
  }
}

class _TabState extends ConsumerState<TabScreen> {
  int _selectedTabIndex = 0;

  void _switchTab(int ix) {
    setState(() {
      _selectedTabIndex = ix;
    });
  }

  void _drawerNavigate(String id) async {
    Navigator.of(context).pop();
    if (id == 'filters') {
      Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: ((context) => const FiltersScreen()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var pageTitle = 'Categories';

    if (_selectedTabIndex == 1) {
      activePage = MealsScreen(
        meals: ref.watch(favProvider),
      );
      pageTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _switchTab,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
      drawer: SideDrawer(onNavigate: _drawerNavigate),
    );
  }
}
