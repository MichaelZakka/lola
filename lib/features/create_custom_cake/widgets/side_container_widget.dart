import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/data/enums/custom_cake_layout.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';

class SideContainerWidget extends StatelessWidget {
  final String title;
  final String image;
  final CustomCakeLayout layout;
  SideContainerWidget(
      {required this.title, required this.image, required this.layout});

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.updateLayout(layout);
      },
      child: GetBuilder<CustomCakeController>(builder: (_) {
        return Container(
          height: 90.h,
          width: double.infinity,
          margin: REdgeInsets.only(bottom: 15.h),
          decoration: BoxDecoration(
              color: controller.layout.value == layout
                  ? AppColors.whiteColor.withOpacity(0.8)
                  : null,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60.h, width: 60.h, child: Image.asset(image)),
              SizedBox(height: 5.h),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
        );
      }),
    );
  }
}
