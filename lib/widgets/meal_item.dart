// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  final Function isFavorite;
  const MealItem({
    Key? key,
    required this.meal,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);

  void _gotoMealdetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _gotoMealdetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    child: Image.asset(
                      meal.imageUrls[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 200,
                      alignment: Alignment.centerRight,
                      color: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => toggleLike(meal.id),
                      icon: Icon(
                        isFavorite(meal.id)
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined,
                        size: 20,
                      ),
                    ),
                    Text("${meal.vaqti} daqiqa"),
                    Text("${meal.price.toStringAsFixed(0)} so'm"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
