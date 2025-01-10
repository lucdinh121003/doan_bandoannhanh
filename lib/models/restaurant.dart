
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'food.dart';
import 'cart_item.dart';

class Restaurant extends ChangeNotifier {
  // danh sách thực đơn
  final List<Food> _menu = [
    // đồ ăn 
   Food(
      name: "Bánh mì",
      description: "Bánh mì là bánh giòn mềm, nhân đa dạng hấp dẫn.",
      imagePath: "lib/images/foods/banhmi.webp",
      price: 15000,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Thập cẩm", price: 15000),      
        Addon(name: "1 trứng", price: 20000),
        Addon(name: "2 trứng", price: 25000),
      ],
    ),

    Food(
      name: "Gà rán",
      description: "Gà giòn rụm bên ngoài, mềm ngọt bên trong.",
      imagePath: "lib/images/foods/garan.webp",
      price: 25000,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Combo", price: 25000),
        Addon(name: "Combo 2", price: 49999),
        Addon(name: "Combo 3", price: 99999),
      ],
    ),

    Food(
      name: "Cơm cuộn",
      description: "Cơm cuộn rau thịt, gói trong lá rong biển.",
      imagePath: "lib/images/foods/comcuon.webp",
      price: 10000,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Cá hồi", price: 10000),
        Addon(name: "Cá ngừ", price: 15000),
        Addon(name: "Thập cẩm", price: 20000),
      ],
    ),

    Food(
      name: "Khoai tây chiên ",
      description: "Khoai giòn vàng, thơm ngon, chấm cùng sốt đậm.",
      imagePath: "lib/images/foods/khoaitaychien.webp",
      price: 15000,
      category: FoodCategory.foods,
      availableAddons: [
        Addon(name: "Combo 1", price: 15000),
        Addon(name: "Combo 2", price: 25000),
        Addon(name: "Combo 3", price: 35000),
      ],
    ),
    // nc uong 

    Food(
      name: "7up",
      description: "Nước ngọt chanh vị nhẹ, sảng khoái mát lạnh.",
      imagePath: "lib/images/drinks/7up.png",
      price: 15000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tẩy", price: 15000),  
        Addon(name: "2 tẩy", price: 17000),
        Addon(name: "3 tẩy", price: 20000),
      ],
    ),

    Food(
      name: "Coca",
      description: "Nước ngọt có ga, vị đậm đà, giải khát tốt.",
      imagePath: "lib/images/drinks/coca.png",
      price: 15000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tẩy", price: 15000),
        Addon(name: "2 tẩy", price: 17000),
        Addon(name: "3 tẩy", price: 20000),
      ],
    ),

    Food(
      name: "Pepsi",
      description: "Đồ uống có ga, hương vị mạnh, rất sảng khoái.",
      imagePath: "lib/images/drinks/pepsi.png",
      price: 15000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "1 tẩy", price: 15000),
        Addon(name: "2 tẩy", price: 17000),
        Addon(name: "3 tẩy", price: 20000),  
      ],
    ),

    Food(
      name: "Chanh day",
      description: "Quả chua ngọt, hương thơm nồng, giải nhiệt tốt.",
      imagePath: "lib/images/drinks/chanhday.png",
      price: 20000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Chua", price: 20000),
        Addon(name: "Chua vừa", price: 25000),
        Addon(name: "Ngọt", price: 30000),
      ],
    ),
    // salad 
    Food(
      name: "Cá hồi ",
      description: "Cá hồi tươi, rau xanh, sốt chua ngọt hòa quyện.",
      imagePath: "lib/images/salads/cahoi.webp",
      price: 25000,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Nhỏ", price: 25000),
        Addon(name: "Vừa", price: 30000),
        Addon(name: "Lớn", price: 35000),
      ],
    ),

    Food(
      name: "Cá ngừ ",
      description: "Cá ngừ dai ngon, dùng làm salad hoặc ăn sống.",
      imagePath: "lib/images/salads/cangu.webp",
      price: 25000,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Nhỏ", price: 25000),
        Addon(name: "Vừa", price: 30000),
        Addon(name: "Lớn", price: 35000),
      ],
    ),

    Food(
      name: "Hoa quả",
      description: "Trái cây tươi đa dạng.",
      imagePath: "lib/images/salads/hoaqua.webp",
      price: 15000,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Nhỏ", price: 15000),
        Addon(name: "Vừa", price: 20000),  
        Addon(name: "Lớn", price: 25000),  
      ],
    ),

    Food(
      name: "Mix",
      description: "Salad nhiều loại.",
      imagePath: "lib/images/salads/mix.webp",
      price: 30000,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Nhỏ", price: 30000),
        Addon(name: "Vừa", price: 35000),  
        Addon(name: "Lớn", price: 40000),
      ],
    ),
    // món tráng miệng
    Food(
      name: "Kem chuối",
      description: "Kem chuối ngọt béo, thêm lạc giòn bùi thơm.",
      imagePath: "lib/images/desserts/kemchuoi.webp",
      price: 10000,  
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Nhỏ", price: 10000),
        Addon(name: "Vừa", price: 13000),
        Addon(name: "Lớn", price: 15000),
      ],
    ),

    Food(
      name: "Kem dâu",
      description: "Kem dâu hồng, chua ngọt nhẹ, mùi thơm hấp dẫn.",
      imagePath: "lib/images/desserts/kemdau.webp",
      price: 17000,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Nhỏ", price: 17000),
        Addon(name: "Vừa", price: 20000),
        Addon(name: "Lớn", price: 25000),
      ],
    ),

    Food(
      name: "Kem sầu riêng",
      description: "Kem sầu riêng béo ngậy, hương vị đặc trưng mạnh.",
      imagePath: "lib/images/desserts/kemsaurieng.webp",
      price: 20000,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Nhỏ", price: 20000),
        Addon(name: "Vừa", price: 25000),
        Addon(name: "Lớn", price: 30000),
      ],
    ),

    Food(
      name: "Kem xoài",
      description: "Kem xoài vàng, vị ngọt thanh, thơm mát lạnh.",
      imagePath: "lib/images/desserts/kemxoai.webp",
      price: 15000,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Nhỏ", price: 15000),
        Addon(name: "Vừa", price: 20000),
        Addon(name: "Lớn", price: 25000),
      ],
    ),
  ];

  // giỏ hàng người dùng
  final List<CartItem> _cart = [];

  // địa chỉ giao hàng (người dùng có thể thay đổi/cập nhật)
  String _deliveryAddress = 'Q9 Thủ Đức TP.Hồ Chí Minh';
  
  
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;


  

  // thêm vào giỏ 
  void addToCart(Food food, List<Addon> selectedAddons) {
    //xem đã có mặt hàng nào trong giỏ hàng có cùng loại thực phẩm đã chọn chưa
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //kiểm tra xem các món ăn có giống nhau không
      bool isSameFood = item.food == food;
      //kiểm tra xem danh sách các món thêm gì đó đã chọn có giống nhau không
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    // nếu mặt hàng đã tồn tại, hãy tăng số lượng
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // nếu không, hãy thêm một mặt hàng mới vào giỏ hàng
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

  // xóa món trong giỏ hàng 
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

  // lấy tổng giá của giỏ hàng
  double getTotalPrice() {
    double total = 0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // lấy tổng số lượng mặt hàng trong giỏ hàng
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear giỏ hàng
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //cập nhật địa chỉ giao hàng
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //tạo biên lai
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // định dạng ngày 
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------");

    for (final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln(" Add-ons: ${_formatAddons((cartItem.selectedAddons))}");
      }
      receipt.writeln();
    }

    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress" );

    return receipt.toString();
  }
  // định dạng giá trị double thành tiền
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}" ;
  }

  // định dạng danh sách các tiện ích bổ sung thành một chuỗi tóm tắt
  String _formatAddons(List<Addon> addons){
    return addons
                .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
                .join(", ");
  }

}
