import 'package:doan_bandoannhanh/components/my_current_location.dart';
import 'package:doan_bandoannhanh/components/my_description_box.dart';
import 'package:doan_bandoannhanh/components/my_drawer.dart';
import 'package:doan_bandoannhanh/components/my_food_tile.dart';
import 'package:doan_bandoannhanh/components/my_sliver_app_bar.dart';
import 'package:doan_bandoannhanh/components/my_tab_bar.dart';
import 'package:doan_bandoannhanh/models/food.dart';
import 'package:doan_bandoannhanh/models/restaurant.dart';
import 'package:doan_bandoannhanh/pages/food_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get food menu
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          //return food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(food: food),
                )),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // my current location
                const MyCurrentLocation(),

                //destination box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
