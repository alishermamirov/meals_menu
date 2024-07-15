// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/category.dart';

class AddNewProductScreen extends StatefulWidget {
  final List<category> Categories;
  const AddNewProductScreen({
    Key? key,
    required this.Categories,
  }) : super(key: key);

  static const routeName = "/add-new-product";

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String activeId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeId = widget.Categories[0].id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ovqat qo'shish"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton(
              isExpanded: true,
              value: activeId,
              onChanged: (value) {
                setState(() {
                  activeId = value.toString();
                });
              },
              items: widget.Categories.map(
                (category) => DropdownMenuItem(
                  child: Text(category.title),
                  value: category.id,
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
