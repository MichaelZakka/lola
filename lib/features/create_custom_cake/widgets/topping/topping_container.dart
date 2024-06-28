import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/data/models/mutual_feature_model.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';

class ToppingContainer extends StatelessWidget {
  final MutualFeaturesModel model;

  ToppingContainer({
    required this.model,
  });

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectTopping(model);
      },
      child: GetBuilder<CustomCakeController>(builder: (_) {
        return Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: controller.selectedTopping.value == null
                  ? null
                  : controller.selectedTopping.value!.id == model.id
                      ? AppColors.primaryColor.withOpacity(0.4)
                      : null),
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
                width: 90.w,
                child: CachedNetworkImage(
                    imageUrl: model.image!, fit: BoxFit.contain),
              ),
              SizedBox(height: 10.h),
              Text(model.name!, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10.h),
              Text(
                '${model.price} SYR',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryColor),
              )
            ],
          ),
        );
      }),
    );
  }
}
