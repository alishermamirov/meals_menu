import 'package:flutter/material.dart';
import 'package:meals_menu/widgets/main_drawer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const routeName = "/product-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mahsulotlar"),
      ),
    );
  }
}
