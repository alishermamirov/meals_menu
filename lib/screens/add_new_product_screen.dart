// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/custom_image_input.dart';

class AddNewProductScreen extends StatefulWidget {
  final List<category> Categories;
  final Function addNewMeal;
  const AddNewProductScreen({
    Key? key,
    required this.Categories,
    required this.addNewMeal,
  }) : super(key: key);

  static const routeName = "/add-new-product";

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final _titleController = TextEditingController();
  final _desciptionController = TextEditingController();
  final _ingredientController = TextEditingController();
  final _priceController = TextEditingController();
  final _timeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();
  late String activeId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeId = widget.Categories[0].id;
  }

  void _save() {
    final title = _titleController.text;
    final desc = _desciptionController.text;
    final ingred = _ingredientController.text;
    final price = _priceController.text;
    final time = _timeController.text;
    final mainImage = _mainImageController.text;
    final firstimage = _firstImageController.text;
    final secondimage = _secondImageController.text;
    final thirdimage = _thirdImageController.text;
    final List<String> ingreds = ingred.split(',');
    final List<String> imageUrls = [
      mainImage,
      firstimage,
      secondimage,
      thirdimage
    ];
    if (title.isEmpty ||
        desc.isEmpty ||
        ingreds.isEmpty ||
        price.isEmpty ||
        time.isEmpty ||
        mainImage.isEmpty ||
        firstimage.isEmpty ||
        secondimage.isEmpty ||
        thirdimage.isEmpty) {
      return;
    }
    widget.addNewMeal(
      Meal(
        id: UniqueKey().toString(),
        title: title,
        imageUrls: imageUrls,
        description: desc,
        vaqti: int.parse(time),
        price: double.parse(price),
        categoryId: activeId,
        ingredients: ingreds,
      ),
    );
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ovqat qo'shish"),
        actions: [
          IconButton(
            onPressed: _save,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Nomi",
                ),
              ),
              TextField(
                controller: _desciptionController,
                decoration: InputDecoration(
                  labelText: "Tarifi",
                ),
                maxLines: 5,
              ),
              TextField(
                controller: _ingredientController,
                decoration: InputDecoration(
                  labelText: "Tarkibi",
                ),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: "Narxi",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: "Vaqti",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _mainImageController,
                label: "Asosiy rasm linkini kiriting",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _firstImageController,
                label: "1-rasm linkini kiriting",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _secondImageController,
                label: "2-rasm linkini kiriting",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _thirdImageController,
                label: "3- rasm linkini kiriting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
