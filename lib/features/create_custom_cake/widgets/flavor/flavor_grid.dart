import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';
import 'package:lola_app/features/create_custom_cake/widgets/flavor/flavor_container.dart';
import 'package:lola_app/features/create_custom_cake/widgets/shape/shape_container.dart';

class FlavorGrid extends StatelessWidget {
  FlavorGrid({super.key});

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        shrinkWrap: true,
        itemCount: controller.flavors.length,
        itemBuilder: (context, index) {
          return FlavorContainer(model: controller.flavors[index]);
        });
  }
}
