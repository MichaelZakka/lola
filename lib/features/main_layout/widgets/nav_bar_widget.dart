import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lola_app/data/enums/main_layout_state.dart';
import 'package:lola_app/features/cart/controllers/cart_controller.dart';
import 'package:lola_app/features/main_layout/controllers/nav_bar_controller.dart';
import 'package:lola_app/features/main_layout/widgets/nav_bar_item.dart';

import '../../../common/constants/app_colors.dart';

class NavBarWidget extends GetWidget<NavBarController> {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72.h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(252, 252, 252, 1),
          boxShadow: [
            BoxShadow(
                blurRadius: 7,
                color: AppColors.blackColor.withOpacity(0.5),
                spreadRadius: 1),
          ],
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavBarItem(
                  icon: Icons.home,
                  title: "home",
                  isSelected: controller.mainState.value == MainLayouState.home,
                  onTap: () {
                    controller.setMainState(MainLayouState.home);
                  }),
              NavBarItem(
                  icon: Icons.shopping_cart_outlined,
                  title: "Cart",
                  isSelected: controller.mainState.value == MainLayouState.cart,
                  onTap: () {
                    Get.delete<CartController>();
                    Get.put(CartController());
                    controller.setMainState(MainLayouState.cart);
                  }),
              NavBarItem(
                  icon: Icons.settings,
                  title: "Settings",
                  iconHeight: 26,
                  isSelected:
                      controller.mainState.value == MainLayouState.settings,
                  onTap: () {
                    controller.setMainState(MainLayouState.settings);
                  }),
            ],
          ),
        ));
  }
}
