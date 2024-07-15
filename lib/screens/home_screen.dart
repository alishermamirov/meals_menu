// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/categories_screen.dart';
import 'package:meals_menu/screens/favorites_screen.dart';
import 'package:meals_menu/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  final List<category> categories;
  final Meals mealModel;
  final Function toggleLike;
  final Function isFavorite;
  HomeScreen({
    Key? key,
    required this.categories,
    required this.mealModel,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);
  
  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "page": CategoriesScreen(
          categories: widget.categories,
          meals: widget.mealModel.list,
        ),
        "title": "Ovqatlar menyusi",
      },
      {
        "page": FavoritesScreen(
            favorites: widget.mealModel.favorites,
            toggleLike: widget.toggleLike,
            isFavorite: widget.isFavorite),
        "title": "Sevimli",
      },
    ];
  }

  int activeIndex = 0;
  void _toggleIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[activeIndex]["title"]),
      ),
      body: _pages[activeIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _toggleIndex,
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Sevimli",
          ),
        ],
      ),
    );
  }
}
