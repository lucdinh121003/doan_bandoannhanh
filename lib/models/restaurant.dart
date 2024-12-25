import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // Food
    Food(
      name: "Banh mi",
      description: "Banh mi ngon tuyet voi.",
      imagePath: "lib/images/foods/banhmi.webp",
      price: 0.99,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Thap cam", price: 0.99),
        Addon(name: "2 trung", price: 1.99),
        Addon(name: "1 trung", price: 2.99),
      ],
    ),

    Food(
      name: "Ga ran",
      description: "Ga ran ngon tuyet voi.",
      imagePath: "lib/images/foods/garan.png",
      price: 0.99,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Combo", price: 0.99),
        Addon(name: "Combo 2", price: 1.99),
        Addon(name: "Combo 3", price: 2.99),
      ],
    ),

    Food(
      name: "Com cuon",
      description: "Com cuon ngon tuyet voi.",
      imagePath: "lib/images/foods/comcuon.webp",
      price: 0.99,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Ca hoi", price: 0.99),
        Addon(name: "Ca ngu", price: 1.99),
        Addon(name: "Thap cam", price: 2.99),
      ],
    ),

    Food(
      name: "Khoai tay chien",
      description: "Khoai tay chien ngon tuyet voi.",
      imagePath: "lib/images/foods/khoaitaychien.png",
      price: 0.99,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Thap cam", price: 0.99),
        Addon(name: "2 trung", price: 1.99),
        Addon(name: "1 trung", price: 2.99),
      ],
    ),
    // drinks

    Food(
      name: "7up",
      description: "7up ngon tuyet voi.",
      imagePath: "lib/images/drinks/7up.png",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tay", price: 0.99),
        Addon(name: "2 tay", price: 1.99),
        Addon(name: "3 tay", price: 2.99),
      ],
    ),

    Food(
      name: "coca",
      description: "coca ngon tuyet voi.",
      imagePath: "lib/images/drinks/coca.png",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tay", price: 0.99),
        Addon(name: "2 tay", price: 1.99),
        Addon(name: "3 tay", price: 2.99),
      ],
    ),

    Food(
      name: "pepsi",
      description: "pepsi ngon tuyet voi.",
      imagePath: "lib/images/drinks/pepsi.png",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tay", price: 0.99),
        Addon(name: "2 tay", price: 1.99),
        Addon(name: "3 tay", price: 2.99),
      ],
    ),

    Food(
      name: "chanh day",
      description: "chanh day ngon tuyet voi.",
      imagePath: "lib/images/drinks/chanhday.png",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tay", price: 0.99),
        Addon(name: "2 tay", price: 1.99),
        Addon(name: "3 tay", price: 2.99),
      ],
    ),
    // salads
    Food(
      name: "ca hoi",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/salads/cahoi.webp",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),

    Food(
      name: "ca ngu",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/salads/cangu.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),

    Food(
      name: "hoa qua",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/salads/hoaqua.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),

    Food(
      name: "Mix",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/salads/tron.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),
    //desserts
    Food(
      name: "kem chuoi",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/desserts/kemchuoi.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),

    Food(
      name: "kem dau",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/desserts/kemdau.webp",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),

    Food(
      name: "kem sau rieng",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/desserts/kemsaurieng.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),

    Food(
      name: "kem xoai",
      description: "ngon tuyet voi.",
      imagePath: "lib/images/desserts/kemxoai.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "nho", price: 0.99),
        Addon(name: "vua", price: 1.99),
        Addon(name: "lon", price: 2.99),
      ],
    ),



  ];


  List<Food> get menu => _menu;
}
