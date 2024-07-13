// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  final List<category> categories;
  const HomeScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ovqatlar menyusi"),
      ),
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: categories
            .map(
              (category) => CategoryItem(
                Category: category,
              ),
            )
            .toList(),
      ),
    );
  }
}
