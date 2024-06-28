import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/widgets/custom_button.dart';
import 'package:lola_app/common/widgets/custom_textfield.dart';
import 'package:lola_app/features/create_custom_cake/controllers/custom_cake_controller.dart';

class ExtraWidget extends StatelessWidget {
  ExtraWidget({super.key});

  final controller = Get.find<CustomCakeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.extraTextController,
          hintText: 'Add text',
        ),
        SizedBox(height: 20.h),
        GetBuilder<CustomCakeController>(builder: (_) {
          return Container(
            height: 180.h,
            width: 130.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.blackColor),
                color: AppColors.greyColor2),
            child: controller.extraImage.value == null
                ? null
                : Image.file(File(controller.extraImage.value!),
                    fit: BoxFit.fill),
          );
        }),
        SizedBox(height: 10.h),
        CustomButton(
            title: 'Add image',
            onTap: () {
              controller.uploadImage();
            },
            width: 130.w)
      ],
    );
  }
}
