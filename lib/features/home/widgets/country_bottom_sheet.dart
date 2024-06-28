import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';

class CountryBottomSheet extends StatelessWidget {
  CountryBottomSheet({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 270.h,
              margin: REdgeInsets.all(20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 10.h),
                  itemCount: controller.countries.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectCountry(controller.countries[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: controller.selectedCountry.value ==
                                    controller.countries[index]
                                ? AppColors.primaryColor.withOpacity(0.6)
                                : null),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: Image.asset(
                                  controller.countries[index].image,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              controller.countries[index].name,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          });
    });
  }
}
