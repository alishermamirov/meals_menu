import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/category_meals_screen.dart';
import 'package:meals_menu/screens/home_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _categories = Categories();
  final _meals = Meals();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routes: {
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
      },
      home: HomeScreen(categories: _categories.list,meals:_meals.list),
    );
  }
}
