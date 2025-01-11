import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doan_bandoannhanh/models/restaurant.dart';
import 'package:doan_bandoannhanh/pages/cart_page.dart';

class MyCartIcon extends StatelessWidget {
  const MyCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final cartItemCount = restaurant.cart.length;

        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Chuyển đến trang giỏ hàng
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                );
              },
            ),
            if (cartItemCount > 0)
              Positioned(
                right: 4,
                top: 4,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(
                    '$cartItemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
