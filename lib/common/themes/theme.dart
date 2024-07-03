import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lola_app/common/constants/app_colors.dart';

import '../providers/local/cache_provider.dart';

class AppTheme {
  static ThemeData getAppTheme(context) {
    return ThemeData(
      // timePickerTheme: TimePickerThemeData(
      //   hourMinuteColor:
      //       MaterialStateColor.resolveWith((Set<MaterialState> states) {
      //     if (states.contains(MaterialState.selected)) {
      //       return AppColors.primaryColor;
      //     }
      //     return Colors.transparent;
      //   }),
      //   dayPeriodColor:
      //       MaterialStateColor.resolveWith((Set<MaterialState> states) {
      //     if (states.contains(MaterialState.selected)) {
      //       return AppColors.primaryColor;
      //     }
      //     return Colors.transparent;
      //   }),
      // ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
      ),
      // shadowColor: AppColors.shadowColor,
      // scaffoldBackgroundColor: AppColors.whiteColor,
      // colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      textTheme: TextTheme(
        
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontFamily: "Honey Crepes",
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          fontFamily: "Honey Crepes",
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      
        labelSmall: TextStyle(
          fontFamily: CacheProvider.getAppLocale() == "en" ||
                  CacheProvider.getAppLocale() == null
              ? 'Poppins'
              : 'Cairo',
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Honey Crepes"),
        bodyLarge: TextStyle(
          fontFamily: 'Honey Crepes',
          fontSize: 20.sp,
          // fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 10.sp,
          fontFamily: CacheProvider.getAppLocale() == "en" ||
                  CacheProvider.getAppLocale() == null
              ? 'Poppins'
              : 'Cairo',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
