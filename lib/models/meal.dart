class Meal {
  final String id;
  final String title;
  final List<String> imageUrls;
  final String description;
  final int vaqti;
  final double price;
  final String categoryId;
  final List<String> ingredients;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.vaqti,
    required this.price,
    required this.categoryId,
    required this.ingredients,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
        id: "o1",
        title: "Lavash",
        imageUrls: [
          "assets/images/lavash.jpg",
          "assets/images/lavash1.jpg",
          "assets/images/lavash2.jpg",
          "assets/images/lavash3.jpg",
        ],
        description: "Lavash haqida",
        vaqti: 10,
        price: 25000,
        categoryId: "c1",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o2",
        title: "Burger",
        imageUrls: [
          "assets/images/burger.jpg",
          "assets/images/burger1.jpg",
          "assets/images/burger2.jpg",
          "assets/images/burger3.jpg",
        ],
        description: "burger haqida",
        vaqti: 10,
        price: 30000,
        categoryId: "c1",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o3",
        title: "Osh",
        imageUrls: [
          "assets/images/milliy.jpg",
          "assets/images/osh1.jpg",
          "assets/images/osh2.jpg",
          "assets/images/osh3.jpg"
        ],
        description: "Ajoyib osh",
        vaqti: 50,
        price: 150000,
        categoryId: "c2",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o4",
        title: "somsa",
        imageUrls: [
          "assets/images/somsa.jpg",
          "assets/images/somsa1.jpg",
          "assets/images/somsa2.jpg",
          "assets/images/somsa3.jpg"
        ],
        description: "somsa haqida",
        vaqti: 15,
        price: 40000,
        categoryId: "c2",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o5",
        title: "Pitsa",
        imageUrls: [
          "assets/images/pizza.jpg",
          "assets/images/pizza1.jpg",
          "assets/images/pizza2.jpg",
          "assets/images/pizza3.jpg",
        ],
        description: "pitsa haqida",
        vaqti: 25,
        price: 80000,
        categoryId: "c3",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o6",
        title: "Fransiya taomi",
        imageUrls: [
          "assets/images/francemeal.jpg",
          "assets/images/francemeal1.jpg",
          "assets/images/francemeal2.jpg",
        ],
        description: "Taom haqida",
        vaqti: 10,
        price: 30000,
        categoryId: "c4",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o7",
        title: "Coca Cola",
        imageUrls: [
          "assets/images/cola.jpg",
          "assets/images/cola1.jpg",
          "assets/images/cola2.jpg",
        ],
        description: "Cola haqida",
        vaqti: 0,
        price: 15000,
        categoryId: "c5",
        ingredients: ["1-tarkib", "2-tarkib"]),
    Meal(
        id: "o8",
        title: "Salat",
        imageUrls: [
          "assets/images/salad.jpg",
          "assets/images/salad1.jpg",
          "assets/images/salad2.jpg",
          "assets/images/salad3.jpg",
        ],
        description: "Salat haqida",
        vaqti: 5,
        price: 20000,
        categoryId: "c6",
        ingredients: ["1-tarkib", "2-tarkib"]),
  ];

  List<Meal> get list {
    return _list;
  }

  List<Meal> _favorites = [];

  List<Meal> get favorites {
    return _favorites;
  }

  void toggleLike(String id) {
    final index = _favorites.indexWhere(
      (element) => element.id == id,
    );
    if (index < 0) {
      _favorites.add(_list.firstWhere(
        (element) => element.id == id,
      ));
    } else {
      _favorites.removeWhere(
        (element) => element.id == id,
      );
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void deleteMeal(String id){
    _list.removeWhere((element) => element.id==id,);
  }
}
