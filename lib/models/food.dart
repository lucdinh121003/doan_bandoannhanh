// Food item


class Food{
  final String name; // cheese burger
  final String description; // a burger full of cheese
  final String imagePath; // lib/images/cheese_burger.png
  final double price; // 4.99
  final FoodCategory category; // burger
  final List<Addon> availableAddons; // [extra cheese, sauce]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// Food categories
enum FoodCategory {
  foods,
  salads,
  desserts,
  drinks,
}


class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
