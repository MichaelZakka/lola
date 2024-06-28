import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/common/utils/utils.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/registration/controllers/register_controller.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500.h,
      width: 330.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: REdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Form(
        key: controller.registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: controller.nameController,
              hintText: 'Full Name',
              validator: (val) {
                return Utils.isFeildValidated(val!.trim());
              },
              icon: const Icon(
                Icons.person_2_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: controller.emailController,
              validator: (val) {
                return Utils.isEmailValidated(val!.trim());
              },
              hintText: 'Email',
              icon: const Icon(
                Icons.email_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: controller.phoneController,
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
              validator: (val) {
                return Utils.isFeildValidated(val!.trim());
              },
              icon: const Icon(
                Icons.phone_enabled_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                validator: (val) {
                  return Utils.isPasswordValidated(val!.trim());
                },
                hintText: 'Password',
                icon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryColor,
                ),
                obscureText: controller.passwordObscureText.value,
                maxLines: 1,
                suffix: IconButton(
                  onPressed: () {
                    controller.passwordObscureText.value =
                        !controller.passwordObscureText.value;
                  },
                  icon: Icon(controller.passwordObscureText.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Obx( () =>
              CustomTextField(
                controller: controller.confirmPasswordController,
                validator: (val) {
                  if (controller.confirmPasswordController.value.text !=
                      controller.passwordController.value.text) {
                    return 'Password don\'t match';
                  } else {
                    return null;
                  }
                },
                hintText: 'confirm password',
                icon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryColor,
                ),
                obscureText: controller.passwordObscureText.value,
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Obx(
              () => controller.registerReqState.value == RequestStatus.loading
                  ? const CustomLoader()
                  : CustomButton(
                      title: 'Sign up',
                      onTap: () {
                        if (controller.registerFormKey.currentState!
                            .validate()) {
                          controller.register();
                        }
                      }),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an account ?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    Get.offAndToNamed(AppRoute.loginPageUrl);
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
