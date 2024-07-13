import 'package:flutter/material.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/screens/home_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  final _categories=Categories();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(categories:_categories.list),
    );
  }
}
