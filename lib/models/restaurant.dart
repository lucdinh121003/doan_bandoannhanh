import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'food.dart';
import 'cart_item.dart';

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

  // G E T T E R S
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // O P E R A T I O N S

  // user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item alrealy with  the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    // if item already exists, increase it  quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of item in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
