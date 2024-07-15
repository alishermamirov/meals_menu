import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/add_new_product_screen.dart';
import 'package:meals_menu/screens/category_meals_screen.dart';
import 'package:meals_menu/screens/home_screen.dart';
import 'package:meals_menu/screens/meal_details_screen.dart';
import 'package:meals_menu/screens/product_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _categories = Categories();

  final _meals = Meals();

  void toggleLike(String id) {
    setState(() {
      _meals.toggleLike(id);
    });
  }

  bool isFavorite(String id) {
    return _meals.favorites.any(
      (element) => element.id == id,
    );
  }

  void addNewMeal(Meal meal) {
    _meals.addNewMeal(meal);
  }

  void deleteMeal(String id){
    _meals.deleteMeal(id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(isFavorite: isFavorite, toggleLike: toggleLike),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        ProductScreen.routeName: (context) => ProductScreen(
              meals: _meals.list,deleteMeal:deleteMeal
            ),
        HomeScreen.routeName: (context) => HomeScreen(
            categories: _categories.list,
            mealModel: _meals,
            toggleLike: toggleLike,
            isFavorite: isFavorite),
        AddNewProductScreen.routeName: (context) => AddNewProductScreen(
            Categories: _categories.list, addNewMeal: addNewMeal),
      },
      home: HomeScreen(
        categories: _categories.list,
        mealModel: _meals,
        toggleLike: toggleLike,
        isFavorite: isFavorite,
      ),
    );
  }
}
