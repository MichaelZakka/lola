import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';
import 'package:lola_app/features/create_custom_cake/widgets/shape/shape_container.dart';

class ShapeGrid extends StatelessWidget {
  ShapeGrid({super.key});

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 1.1.sp,
        ),
        shrinkWrap: true,
        itemCount: controller.shapes.length,
        itemBuilder: (context, index) {
          return ShapeContainer(model: controller.shapes[index]);
        });
  }
}
