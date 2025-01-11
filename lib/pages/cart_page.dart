import 'package:doan_bandoannhanh/components/my_button.dart';
import 'package:doan_bandoannhanh/components/my_cart_tile.dart';
import 'package:doan_bandoannhanh/models/restaurant.dart';
import 'package:doan_bandoannhanh/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //Giỏ hàng của người dùng
        final userCart = restaurant.cart;

        //trả về giao diện giỏ hàng
        return Scaffold(
          appBar: AppBar(
            title: const Text("Giỏ Hàng"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //nút xóa giỏ hàng
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          "Bạn có chắc muốn xóa khỏi giỏ hàng?"),
                      actions: [
                        //nút hủy 
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Hủy"),
                        ),
                        //nút đồng ý 
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: Text("Đồng ý"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          body: Column(
            children: [
              //danh sách giỏ hàng
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Giỏ hàng trống ..."),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //lấy từng món ăn trong giỏ hàng
                                final cartItem = userCart[index];

                                //  trả về giao diện món ăn đó
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              //nút thanh toán
              MyButton(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      ),
                  text: "Đi đến thanh toán"),

              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
