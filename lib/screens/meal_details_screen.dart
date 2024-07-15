import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  static const routeName = "meal-details";

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mealData = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(mealData.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              viewportFraction: 1,
              initialPage: activeImageIndex,
              onPageChanged: (index, reason) {
                setState(() {
                  activeImageIndex = index;
                });
              },
            ),
            items: mealData.imageUrls.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: image.contains("http")
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: mealData.imageUrls.map(
              (image) {
                final imageIndex = mealData.imageUrls.indexOf(image);
                return Container(
                  height: 8,
                  width: 8,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeImageIndex == imageIndex
                        ? Colors.blue
                        : Colors.grey,
                  ),
                );
              },
            ).toList(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${mealData.price} so'm"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tarifi"),
                Text(mealData.description),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) =>
                  Text(mealData.ingredients[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: mealData.ingredients.length,
            ),
          )
        ],
      ),
    );
  }
}
