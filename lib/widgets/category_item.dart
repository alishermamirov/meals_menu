// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final category Category;
  final List<Meal> categoryMeal;
  const CategoryItem({
    Key? key,
    required this.Category,
    required this.categoryMeal,
  }) : super(key: key);

  void _gotoCategoryMealsScreen(BuildContext context) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => CategoryMealsScreen(),
    //   ));

    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      "categorytitle": Category.title,
      "meals": categoryMeal,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _gotoCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            Container(
              color: Colors.amber,
              width: double.infinity,
              child: Image.asset(
                Category.imageurl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Category.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
