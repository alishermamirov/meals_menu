// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  final Function toggleLike;
  final Function isFavorite;
  const FavoritesScreen({
    Key? key,
    required this.favorites,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favorites.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, index) {
              final favorite = favorites[index];
              return MealItem(
                  meal: favorite,
                  toggleLike: toggleLike,
                  isFavorite: isFavorite);
            },
          )
        : Center(
            child: Text("Sevimli mavjud emas"),
          );
  }
}
