import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/utils/hex_color.dart';
import 'package:lola_app/data/models/custom_cake_model.dart';
import 'package:lola_app/features/cart/controllers/cart_controller.dart';
import 'package:lola_app/features/cart/widgets/column_text_widget.dart';

class CustomCakeCartWidget extends StatelessWidget {
  final CustomCakeModel model;
  CustomCakeCartWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.greyColor2, borderRadius: BorderRadius.circular(20)),
      padding: REdgeInsets.all(10),
      margin: REdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnTextWidget(
                  image: model.shape!.image!, text: model.shape!.name!),
              ColumnTextWidget(
                  image: model.flavor!.image!, text: model.flavor!.name!),
              ColumnTextWidget(
                  image: model.topping!.image!, text: model.topping!.name!),
              CircleAvatar(
                backgroundColor: HexColor(model.color!.hex!),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${model.price} syp'),
              GetBuilder<CartController>(
                builder: (cc) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          cc.decreaseCustomCakeQuantity(model);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(model.quantity.toString()),
                      IconButton(
                        onPressed: () {
                          cc.increaseCustomCakeQuantity(model);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  );
                }
              )
            ],
          )
        ],
      ),
    );
  }
}
