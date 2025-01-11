import 'package:doan_bandoannhanh/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: const Text('Vị trí của bạn'),
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Nhập địa chỉ...',
        ),
      ),
      actions: [
        //nút hủy
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
            textController.clear();
          },
          child: const Text('Hủy'),
        ),

        //Nút lưu
        MaterialButton(
          onPressed: (){
            //lưu địa chỉ mới
            String newAddress = textController.text;
            context.read<Restaurant>().updateDeliveryAddress(newAddress);
            Navigator.pop(context);
            textController.clear();
          },
          child: const Text('Lưu'),
        ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Giao hàng ngay',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
          GestureDetector(
            onTap: ()=> openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),                                  
                //drop down của thực đơn 
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}