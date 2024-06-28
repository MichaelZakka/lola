import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';
import 'package:lola_app/features/home/widgets/country_bottom_sheet.dart';

class HomeTopLayout extends StatelessWidget {
  HomeTopLayout({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: REdgeInsets.only(left: 15.w),
            child: TextButton(
                onPressed: () {
                  Get.bottomSheet(CountryBottomSheet());
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Image.asset(
                        'assets/images/icons/truck.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Deliver To',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GetBuilder<HomeController>(
                      builder: (_) {
                        return SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: Image.asset(
                              controller.selectedCountry.value!.image,
                              fit: BoxFit.fill,
                            ));
                      }
                    )
                  ],
                )),
          ),
          SizedBox(height: 10.h),
          Text(
            'Explore All Categories !',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 32.sp,
                  color: AppColors.whiteColor,
                ),
          ),
        ],
      ),
    );
  }
}
