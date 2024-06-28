import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/common/utils/utils.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/registration/controllers/login_controller.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350.h,
      width: 330.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: REdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Obx(
              () => controller.loginReqState.value == RequestStatus.loading
                  ? const CustomLoader()
                  : CustomButton(
                      title: 'Login',
                      onTap: () {
                        if (controller.loginFormKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                    ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    Get.offAndToNamed(AppRoute.registerPageUrl);
                  },
                  child: Text(
                    'Create Account',
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
