class category {
  final String id;
  final String title;
  final String imageurl;

  category({
    required this.id,
    required this.title,
    required this.imageurl,
  });
}

class Categories {
  List<category> _list = [
    category(
      id: "c1",
      title: "Fast Food",
      imageurl: "assets/images/burger.jpg",
    ),
    category(
      id: "c2",
      title: "Milliy Taomlar",
      imageurl: "assets/images/milliy.jpg",
    ),
    category(
      id: "c3",
      title: "Italiya taomlari",
      imageurl: "assets/images/pizza.jpg",
    ),
    category(
      id: "c4",
      title: "Fransiya taomlari",
      imageurl: "assets/images/pizza.jpg",
    ),
    category(
      id: "c5",
      title: "Ichimliklar",
      imageurl: "assets/images/cola.jpg",
    ),
    category(
      id: "c6",
      title: "Saladlar",
      imageurl: "assets/images/salad.jpg",
    ),
  ];

  List<category> get list {
    return _list;
  }
}
