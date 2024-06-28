import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final double iconHeight;
  const NavBarItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected,
      required this.onTap,
      this.iconHeight = 25});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color.fromRGBO(154, 170, 180, 1),
            ),
            SizedBox(
              height: 5.h,
            ),
            Flexible(
              child: Text(
                title.tr,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      letterSpacing: 0,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: isSelected
                          ? AppColors.primaryColor
                          : const Color.fromRGBO(154, 170, 180, 1),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
