import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/widgets/custom_appbar.dart';
import 'package:lola_app/common/widgets/custom_button.dart';
import 'package:lola_app/features/home/controllers/cake_details_controller.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';
import 'package:lola_app/features/home/widgets/detail_card.dart';

class CakeDetailsPage extends GetView<CakeDetailsController> {
  const CakeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CakeDetailsController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Details',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: GetBuilder<HomeController>(builder: (context) {
          return CustomButton(
            title: controller.cake!.isInCart!
                ? 'Cake already in cart'
                : 'Add To Card',
            buttonColor: controller.cake!.isInCart!
                ? AppColors.greyColor2
                : AppColors.primaryColor,
            onTap: () {
              controller.cake!.isInCart!
                  ? null
                  : Get.find<HomeController>().addCakeToCart(controller.cake!);
            },
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200.h,
              child: CachedNetworkImage(
                imageUrl: EndPoints.imageBaseUrl + controller.cake!.image!,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              controller.cake!.name!,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 25.sp),
            ),
            SizedBox(height: 10.h),
            GridView(
              shrinkWrap: true,
              padding: REdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w),
              children: [
                DetailCard(
                  image: 'assets/images/icons/flavor.png',
                  text: controller.cake!.flavor!,
                ),
                DetailCard(
                  text: controller.cake!.numOfPeople.toString(),
                  image: 'assets/images/icons/quantity.png',
                ),
                DetailCard(
                  text: controller.categoryName!,
                  image: 'assets/images/icons/event.png',
                ),
                DetailCard(
                  text: '${controller.cake!.price} SYP',
                  image: 'assets/images/icons/shopping.png',
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [

            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     DetailCard(
            //       image: 'assets/images/icons/flavor.png',
            //       text: 'Vanilla',
            //     ),
            //     DetailCard(
            //       text: '5',
            //       image: 'assets/images/icons/quantity.png',
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
