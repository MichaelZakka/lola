import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/routers/app_router.dart';

class MakeYourOwnWidget extends StatelessWidget {
  const MakeYourOwnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoute.createCustomCakePageUrl);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: REdgeInsets.symmetric(horizontal: 25),
        elevation: 7,
        shadowColor: AppColors.blackColor,
        child: Container(
          height: 100.h,
          width: double.infinity,
          padding: REdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.cake,
                color: AppColors.primaryColor,
                size: 50.sp,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Make Your Own Cake !',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20.sp, color: AppColors.blackColor),
                  ),
                  Text(
                    'No One Can Do It Better Than You',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 12.sp, color: AppColors.blackColor),
                  )
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.arrow_circle_right_outlined,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
