// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
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
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void toggleLike(String id) {
    setState(() {
      widget.toggleLike(id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("O'chirilmoqda"),
        action: SnackBarAction(
          label: "Bekor qilish",
          onPressed: () {
            setState(() {
              widget.toggleLike(id);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: widget.favorites.length,
            itemBuilder: (context, index) {
              final favorite = widget.favorites[index];
              return MealItem(
                  meal: favorite,
                  toggleLike: toggleLike,
                  isFavorite: widget.isFavorite);
            },
          )
        : Center(
            child: Text("Sevimli mavjud emas"),
          );
  }
}
