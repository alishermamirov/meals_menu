// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/add_new_product_screen.dart';
import 'package:meals_menu/widgets/main_drawer.dart';

class ProductScreen extends StatelessWidget {
  final List<Meal> meals;
  const ProductScreen({
    Key? key,
    required this.meals,
  }) : super(key: key);

  static const routeName = "/product-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewProductScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(meal.imageUrls[0]),
            ),
            title: Text(meal.title),
            subtitle: Text("${meal.price} so'm"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
