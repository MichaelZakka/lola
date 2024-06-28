import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/widgets/custom_appbar.dart';
import 'package:lola_app/common/widgets/custom_button.dart';
import 'package:lola_app/common/widgets/custom_textfield.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/settings/controllers/edit_profile_controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Profile',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 15.w,
        ),
        child: Obx(
          () => controller.saveUpdateReq.value == RequestStatus.loading
              ? const CustomLoader()
              : CustomButton(
                  title: 'Save',
                  onTap: () {
                    controller.saveUpdateInfo();
                  },
                ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GetBuilder<EditProfileController>(builder: (_) {
                      return CircleAvatar(
                        radius: 50.r,
                        backgroundColor: AppColors.greyColor,
                        backgroundImage: controller.pickedImage!.value != ''
                            ? FileImage(File(controller.pickedImage!.value))
                            : controller.user!.image != null
                                ? DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            EndPoints.imageBaseUrl +
                                                controller.user!.image!))
                                    .image
                                : Image.asset(
                                    'assets/images/icons/user.png',
                                    fit: BoxFit.scaleDown,
                                  ).image,
                      );
                    }),
                    Positioned(
                      bottom: 2.h,
                      right: 0.w,
                      child: InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: const Icon(
                          Icons.camera,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                controller: controller.nameController,
                hintText: controller.user!.name!,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                  controller: controller.emailController,
                  hintText: controller.user!.email!),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                  controller: controller.phoneController,
                  hintText: controller.user!.phone!)
            ],
          ),
        ),
      ),
    );
  }
}
