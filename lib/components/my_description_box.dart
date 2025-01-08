import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //kiểu chữ 
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Phí giao hàng
          Column(
            children: [
              Text('\20.000', style: mySecondaryTextStyle,),
              Text('Phí giao hàng',style: mySecondaryTextStyle,),
            ],
          ),

          //thời gian giao hàng 
          Column(
            children: [
              Text('15-30 phút',style: myPrimaryTextStyle,),
              Text('Thời gian giao hàng',style: mySecondaryTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}