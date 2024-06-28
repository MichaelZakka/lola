import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/widgets/custom_button.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/common/widgets/no_data.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/cart/controllers/cart_controller.dart';
import 'package:lola_app/features/cart/widgets/cake_cart_widget.dart';
import 'package:lola_app/features/cart/widgets/custom_cake_cart_widget.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(builder: (_) {
        return Obx(() {
          return controller.checkoutRequestStatus.value == RequestStatus.loading
              ? const CustomLoader()
              : CustomButton(
                  title:
                      'Checkout \ntotal ${controller.totalPrice.toStringAsFixed(2)} SYP',
                  onTap: () {
                    if (controller.cartCakes.isNotEmpty ||
                        controller.cartCustomCakes.isNotEmpty) {
                      controller.checkOut();
                    }
                  },
                  isTextCenter: true,
                );
        });
      }),
      body: Padding(
        padding: REdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                switch (controller.cartRequestStatus.value) {
                  case RequestStatus.begin:
                  case RequestStatus.loading:
                    return const CustomLoader();
                  case RequestStatus.success:
                    return GetBuilder<CartController>(builder: (_) {
                      return Column(
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.cartCakes.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return CakeCartWidget(
                                  model: controller.cartCakes[i],
                                );
                              }),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.cartCustomCakes.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return CustomCakeCartWidget(
                                  model: controller.cartCustomCakes[i],
                                );
                              }),
                        ],
                      );
                    });
                  case RequestStatus.nodata:
                    return const NoData(text: 'Cart is Empty');
                  default:
                    return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
