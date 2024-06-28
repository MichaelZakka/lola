import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/data/models/cake_model.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';

class CakeWidget extends StatelessWidget {
  CakeWidget({required this.cakeModel, this.categoryName});
  CakeModel cakeModel;
  String? categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.cakeDetailsPageUrl, arguments: {
          'cakeModel': cakeModel,
          'categoryName': categoryName,
        });
      },
      child: Card(
        shadowColor: AppColors.blackColor,
        elevation: 4,
        margin: REdgeInsets.only(right: 20.w),
        child: Container(
          width: 180.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 120.h,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: EndPoints.imageBaseUrl + cakeModel.image!,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 3.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cakeModel.name!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        cakeModel.flavor!,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '100,000 SYP',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          GetBuilder<HomeController>(builder: (hc) {
                            return IconButton(
                              onPressed: () {
                                cakeModel.isInCart!
                                    ? hc.removeCakeFromCart(cakeModel)
                                    : hc.addCakeToCart(cakeModel);
                              },
                              icon: Icon(
                                cakeModel.isInCart! ? Icons.check : Icons.add,
                                color: AppColors.primaryColor,
                              ),
                            );
                          })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
