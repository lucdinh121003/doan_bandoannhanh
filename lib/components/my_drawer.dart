import 'package:doan_bandoannhanh/components/my_drawer%20_title.dart';
import 'package:flutter/material.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),


            //home list title
            MyDrawerTile(
              text: "Trang Chủ",
              icon: Icons.home, 
              onTap: ()=> Navigator.pop(context),
            ),

            //setting list title
            MyDrawerTile(
              text: "Cài Đặt",
              icon: Icons.settings, 
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  )
                );
              },
            ),
            
            const Spacer(),

            //logout list title
            MyDrawerTile(
              text: "Đăng Xuất",
              icon: Icons.logout, 
              onTap: (){},
            ),

            const SizedBox(height: 25),

        ]
      ),
    );
  }
}