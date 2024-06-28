import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/data/models/category_model.dart';
import 'package:lola_app/features/home/controllers/cakes_list_controller.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';
import 'package:lola_app/features/home/widgets/cake_widget.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required this.categoryModel, required this.index});
  CategoryModel categoryModel;
  int index;

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: CachedNetworkImage(
                    imageUrl: EndPoints.imageBaseUrl + categoryModel.image!,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                width: 10.w,
              ),
              Text(
                categoryModel.title!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 20.sp),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.toNamed(
                    AppRoute.cakesListPage,
                    arguments: {
                      'categoryName': categoryModel.title,
                      'cakeList': controller.categories[index].cakes
                    },
                  );
                },
                child: Text(
                  'See All',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
                itemCount: categoryModel.cakes!.length,
                shrinkWrap: true,
                padding: REdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return CakeWidget(
                    cakeModel: categoryModel.cakes![i],
                    categoryName: categoryModel.title!,
                  );
                }),
          )
        ],
      ),
    );
  }
}
