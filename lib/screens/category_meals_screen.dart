import 'package:flutter/material.dart';
import 'package:meals_menu/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data["categorytitle"]),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: data["meals"].length,
        itemBuilder: (context, index) => MealItem(
          meal: data["meals"][index],
        ),
      ),
    );
  }
}
