import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/common/widgets/custom_button.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/settings/controllers/settings_controller.dart';
import 'package:lola_app/features/settings/widgets/history_widget.dart';
import 'package:lola_app/features/settings/widgets/profile_top_widget.dart';
import 'package:lola_app/features/settings/widgets/profile_widget.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              const ProfileTopWidget(),
              Obx(
                () =>
                    controller.userInfoReqStatus.value == RequestStatus.loading
                        ? CustomLoader(
                            height: 80.h,
                          )
                        : ProfileWidget(),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                title: 'Edit Profile',
                ispng: true,
                icon: 'assets/images/icons/edit.png',
                onTap: () {
                  Get.toNamed(
                    AppRoute.editProfilePageUrl,
                    arguments: controller.user,
                  );
                },
                width: 250.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              const HistoryWidget(),
              const Spacer(),
              Obx(
                () => controller.logoutReqStatus.value == RequestStatus.loading
                    ? const CustomLoader(
                        color: Colors.red,
                      )
                    : CustomButton(
                        title: 'Logout',
                        buttonColor: Colors.red,
                        ispng: true,
                        icon: 'assets/images/icons/logout.png',
                        onTap: () {
                          controller.logout();
                        },
                      ),
              ),
            ],
          )),
    );
  }
}
