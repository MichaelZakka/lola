import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/features/registration/controllers/register_controller.dart';
import 'package:lola_app/features/registration/widgets/register_widget.dart';

import '../../../common/constants/app_colors.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Stack(
                children: [
            Container(
              height: Get.height,
              width: Get.width,
              color: AppColors.primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80.h,),
                    Text(
                      'Welcome To Lola',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 40.sp, color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Create your account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 30.sp, color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    RegisterWidget()
                  ],
                ),
              ),
            ),
                ],
              ),
          ),
        ));
  }
}
