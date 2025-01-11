// Food item


class Food{
  final String name; // tên 
  final String description; // mô tả 
  final String imagePath; // ảnh 
  final double price; // giá 
  final FoodCategory category; // loại 
  final List<Addon> availableAddons; // thêm gì đó như thêm rau, thêm nước sốt...

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// loai thuc an
enum FoodCategory {
  foods,
  salads,
  desserts,
  drinks,
}

extension FoodCategoryExtension on FoodCategory {
  String get displayName {
    switch (this) {
      case FoodCategory.foods:
        return 'Món ăn';
      case FoodCategory.salads:
        return 'Salad';
      case FoodCategory.desserts:
        return 'Tráng miệng';
      case FoodCategory.drinks:
        return 'Đồ uống';
      default:
        return '';
    }
  }
}



class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
