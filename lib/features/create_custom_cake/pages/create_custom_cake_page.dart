import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/utils/hex_color.dart';
import 'package:lola_app/common/widgets/custom_appbar.dart';
import 'package:lola_app/common/widgets/custom_button.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/data/enums/custom_cake_layout.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';
import 'package:lola_app/features/create_custom_cake/widgets/color/color_grid.dart';
import 'package:lola_app/features/create_custom_cake/widgets/extra/extra_widget.dart';
import 'package:lola_app/features/create_custom_cake/widgets/flavor/flavor_grid.dart';
import 'package:lola_app/features/create_custom_cake/widgets/shape/shape_grid.dart';
import 'package:lola_app/features/create_custom_cake/widgets/side_container_widget.dart';
import 'package:lola_app/features/create_custom_cake/widgets/topping/toppings_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CreateCustomCakePage extends GetView<CustomCakeController> {
  const CreateCustomCakePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomCakeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Custom Cake',
        hasLeading: true,
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 15),
            child: Center(
              child: GetBuilder<CustomCakeController>(builder: (_) {
                return Text(
                  '${controller.totalPrice!.toStringAsFixed(2)} SYP',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.primaryColor),
                );
              }),
            ),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        child: GetBuilder<CustomCakeController>(builder: (_) {
          return controller.createCustomCakeStatus.value ==
                  RequestStatus.loading
              ? const CustomLoader()
              : CustomButton(
                  title: 'Create Cake',
                  onTap: () {
                    controller.isCreateValidated()
                        ? controller.createCustomCake()
                        : null;
                  },
                  buttonColor: controller.isCreateValidated()
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                );
        }),
      ),
      body: Obx(
        () => controller.mainRequestStatus.value == RequestStatus.loading
            ? const Center(child: CustomLoader())
            : SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 230.h,
                        color: AppColors.greyColor2,
                        child: Obx(() {
                          switch (controller.layout.value) {
                            case CustomCakeLayout.shape:
                              return controller.selectedShape.value == null
                                  ? Container()
                                  : CachedNetworkImage(
                                      imageUrl: EndPoints.imageBaseUrl + controller
                                          .selectedShape.value!.image!);
                            case CustomCakeLayout.flavor:
                              return controller.selectedFlavor.value == null
                                  ? Container()
                                  : CachedNetworkImage(
                                      imageUrl: EndPoints.imageBaseUrl + controller
                                          .selectedFlavor.value!.image!);
                            case CustomCakeLayout.color:
                              return Container(
                                color: controller.selectedColor.value == null
                                    ? AppColors.greyColor
                                    : HexColor(
                                        controller.selectedColor.value!.hex!),
                              );
                            case CustomCakeLayout.toppings:
                              return controller.selectedTopping.value == null
                                  ? Container()
                                  : CachedNetworkImage(
                                      imageUrl: EndPoints.imageBaseUrl + controller
                                          .selectedTopping.value!.image!);
                            case CustomCakeLayout.extra:
                              return Container(
                                width: double.infinity.w,
                                alignment: Alignment.center,
                                child:
                                    const Text('Add a text or an image on your cake'),
                              );
                            default:
                              return Container();
                          }
                        }),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Container(
                            width: 100.w,
                            height: 500.h,
                            padding: REdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SideContainerWidget(
                                    title: 'Shape',
                                    image: 'assets/images/icons/cake-shape.png',
                                    layout: CustomCakeLayout.shape,
                                  ),
                                  SideContainerWidget(
                                      title: 'Flavor',
                                      image: 'assets/images/icons/flavorr.png',
                                      layout: CustomCakeLayout.flavor),
                                  SideContainerWidget(
                                      title: 'Color',
                                      image:
                                          'assets/images/icons/color-palette.png',
                                      layout: CustomCakeLayout.color),
                                  SideContainerWidget(
                                      title: 'Toppings',
                                      image: 'assets/images/icons/toppings.png',
                                      layout: CustomCakeLayout.toppings),
                                  SideContainerWidget(
                                      title: 'Extra',
                                      image: 'assets/images/icons/extra.png',
                                      layout: CustomCakeLayout.extra),
                                  SizedBox(height: 25.h)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Container(
                            width: 270.w,
                            height: 500.h,
                            child: Obx(() {
                              switch (controller.layout.value) {
                                case CustomCakeLayout.shape:
                                  return ShapeGrid();
                                case CustomCakeLayout.flavor:
                                  return FlavorGrid();
                                case CustomCakeLayout.color:
                                  return ColorGrid();
                                case CustomCakeLayout.toppings:
                                  return ToppingsGrid();
                                case CustomCakeLayout.extra:
                                  return ExtraWidget();
                                default:
                                  return Container();
                              }
                            }),
                          ),
                          SizedBox(
                            height: 40.h,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
