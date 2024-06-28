import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/data/models/cake_model.dart';
import 'package:lola_app/features/cart/controllers/cart_controller.dart';

class CakeCartWidget extends StatelessWidget {
  final CakeModel model;
  CakeCartWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.greyColor2, borderRadius: BorderRadius.circular(20)),
      padding: REdgeInsets.all(10),
      margin: REdgeInsets.only(
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: EndPoints.imageBaseUrl + model.image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name!),
              SizedBox(
                height: 10.h,
              ),
              Text(model.flavor!),
              SizedBox(
                height: 10.h,
              ),
              Text('${model.price} syp'),
              GetBuilder<CartController>(builder: (cc) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cc.decreaseCakeQuantity(model);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(model.quantity.toString()),
                    IconButton(
                      onPressed: () {
                        cc.increaseCakeQuantity(model);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
