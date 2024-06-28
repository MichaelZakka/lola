import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lola_app/common/constants/app_colors.dart';

class ProfileTopWidget extends StatelessWidget {
  const ProfileTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: AppColors.primaryColor,
              size: 40.sp,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              'Profile',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 25.sp),
            ),
          ],
        ),
        Divider(
          indent: 8.w,
          endIndent: 8.w,
          color: AppColors.primaryColor,
          thickness: 1.5,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
