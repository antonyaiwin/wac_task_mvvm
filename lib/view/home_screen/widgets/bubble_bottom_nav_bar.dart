import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_screen_view_model.dart';

class BubbleBottomNavBar extends StatelessWidget {
  const BubbleBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(
      builder: (BuildContext context, HomeScreenViewModel viewModel,
              Widget? child) =>
          MotionTabBar(
        initialSelectedTab: "Home",
        labels: const ["Home", "Category", "Cart", "Offers", "Account"],
        icons: const [
          MingCute.home_4_fill,
          Iconsax.category_2_outline,
          Icons.shopping_cart,
          BoxIcons.bxs_offer,
          MingCute.user_2_fill
        ],
        tabSize: 50,
        textStyle: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: const Color(0XFF555454),
        tabIconSize: 24.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: const Color(0xff92C848),
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          viewModel.changePage(value);
        },
      ),
    );
  }
}
