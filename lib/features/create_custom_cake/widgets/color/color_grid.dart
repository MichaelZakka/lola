import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';
import 'package:lola_app/features/create_custom_cake/widgets/color/color_widget.dart';

class ColorGrid extends StatelessWidget {
  ColorGrid({super.key});

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10.h,
            childAspectRatio: 1.5.sp,
            crossAxisSpacing: 10.w),
        itemCount: controller.colors.length,
        itemBuilder: (context, index) {
          return ColorWidget(model: controller.colors[index]);
        });
  }
}
