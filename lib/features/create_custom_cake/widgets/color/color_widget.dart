import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/utils/hex_color.dart';
import 'package:lola_app/data/models/color_model.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';

class ColorWidget extends StatelessWidget {
  final ColorModel model;
  ColorWidget({required this.model});

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectColor(model);
      },
      child: GetBuilder<CustomCakeController>(builder: (_) {
        return Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: controller.selectedColor.value == null
                      ? Colors.white
                      : controller.selectedColor.value!.id == model.id
                          ? AppColors.primaryColor
                          : Colors.white,
                  width: 2),
              color: HexColor(model.hex!)),
        );
      }),
    );
  }
}
