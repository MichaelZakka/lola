import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/features/settings/controllers/settings_controller.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_) {
      return Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.greyColor,
                    backgroundImage: controller.user!.image != null
                        ? NetworkImage(
                            EndPoints.imageBaseUrl + controller.user!.image!)
                        : null,
                    child: controller.user!.image == null
                        ? Icon(
                            Icons.person_2_outlined,
                            size: 60.sp,
                            color: AppColors.whiteColor,
                          )
                        : null),
                // Positioned(
                //   bottom: 2.h,
                //   right: 0.w,
                //   child: InkWell(
                //     onTap: () {},
                //     child: const Icon(
                //       Icons.camera,
                //       color: AppColors.primaryColor,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            controller.user!.name!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            controller.user!.email!,
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            controller.user!.phone!,
          )
        ],
      );
    });
  }
}
