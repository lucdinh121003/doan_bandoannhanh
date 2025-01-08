import 'package:doan_bandoannhanh/models/food.dart';
import 'package:flutter/material.dart';


class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    // Định dạng giá (có thể chọn cách dùng toStringAsFixed hoặc intl)
    String formattedPrice = food.price.toStringAsFixed(0); 
    // Hoặc dùng intl
    // String formattedPrice = NumberFormat("#,##0").format(food.price);

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Chi tiết về món ăn
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        "$formattedPrice VND", // Hiển thị giá đã được định dạng
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 10),
                      Text(food.description),
                    ],
                  ),
                ),

                const SizedBox(width: 15),
                // Ảnh món ăn
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(food.imagePath, height: 120),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
