import 'package:flutter/material.dart';
import 'package:meals_menu/screens/home_screen.dart';
import 'package:meals_menu/screens/product_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _listItem(String title, Function() handle, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: handle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Menyu"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          _listItem("Bosh sahifa", () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }, Icons.home),
          Divider(),
          _listItem("Mahsulotlar", () {
            Navigator.of(context).pushReplacementNamed(ProductScreen.routeName);
          }, Icons.category),
        ],
      ),
    );
  }
}
