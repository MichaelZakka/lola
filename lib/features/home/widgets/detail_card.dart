import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lola_app/common/constants/app_colors.dart';

class DetailCard extends StatelessWidget {
  final String text;
  final String image;
  DetailCard({
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.blackColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: REdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
