// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/add_new_product_screen.dart';
import 'package:meals_menu/widgets/main_drawer.dart';

class ProductScreen extends StatefulWidget {
  final List<Meal> meals;
  final Function deleteMeal;
  const ProductScreen({
    Key? key,
    required this.meals,
    required this.deleteMeal,
  }) : super(key: key);

  static const routeName = "/product-screen";

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
              Navigator.of(context)
                  .pushNamed(AddNewProductScreen.routeName)
                  .then(
                (value) {
                  if (value == true) {
                    setState(() {});
                  }
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          final meal = widget.meals[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: meal.imageUrls[0].contains("http")
                  ? NetworkImage(meal.imageUrls[0])
                  : AssetImage(meal.imageUrls[0]),
            ),
            title: Text(meal.title),
            subtitle: Text("${meal.price} so'm"),
            trailing: IconButton(
              onPressed: () => setState(() {
                widget.deleteMeal(meal.id);
              }),
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
