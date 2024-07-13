// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/category.dart';

class CategoryItem extends StatelessWidget {
  final category Category;
  const CategoryItem({
    Key? key,
    required this.Category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
