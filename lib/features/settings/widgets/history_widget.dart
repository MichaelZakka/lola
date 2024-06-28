import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/routers/app_router.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: REdgeInsets.all(15),
      shadowColor: AppColors.blackColor,
      // color: AppColors.greyColor,
      elevation: 5,
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoute.historyPageUrl);
        },
        leading: Icon(
          Icons.history,
          color: AppColors.primaryColor,
        ),
        title: Text('Order History'),
        trailing: Icon(
          Icons.arrow_circle_right_outlined,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
