// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Function toggleLike;
  final Function isFavorite;
  const CategoryMealsScreen({
    Key? key,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);

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
      body: data["meals"].isEmpty
          ? Center(
              child: Text("Mahsulot mavjud emas"),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: data["meals"].length,
              itemBuilder: (context, index) => MealItem(
                  meal: data["meals"][index],
                  toggleLike: toggleLike,
                  isFavorite: isFavorite),
            ),
    );
  }
}
