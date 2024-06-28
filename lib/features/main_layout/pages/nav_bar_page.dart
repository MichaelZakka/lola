import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lola_app/data/enums/main_layout_state.dart';
import 'package:lola_app/features/cart/pages/cart_page.dart';
import 'package:lola_app/features/home/pages/home_page.dart';
import 'package:lola_app/features/main_layout/controllers/nav_bar_controller.dart';
import 'package:lola_app/features/main_layout/widgets/nav_bar_widget.dart';
import 'package:lola_app/features/settings/pages/settings_page.dart';

class NavBarPage extends GetView<NavBarController> {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavBarWidget(),
        body: Obx(() {
          switch (controller.mainState.value) {
            case MainLayouState.home:
              return HomePage();
            case MainLayouState.cart:
              return CartPage();
            case MainLayouState.settings:
              return SettingsPage();
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
