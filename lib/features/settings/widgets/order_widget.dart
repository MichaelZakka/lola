import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/utils/utils.dart';
import 'package:lola_app/data/models/order_model.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel order;
  OrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Card(
        shadowColor: AppColors.blackColor,
        elevation: 5,
        child: ExpansionTile(
          title: Text(
            Utils.formatFullDate(order.date!),
          ),
          subtitle: Text(
            '${order.totalPrice} SYP',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          childrenPadding: REdgeInsets.all(15),
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.cakes!.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: REdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(order.cakes![i].name!),
                        Text(order.cakes![i].price!)
                      ],
                    ),
                  );
                }),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.customCakes!.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: REdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Custom Cake ${i + 1}'),
                        Text(order.customCakes![i].price!.toString())
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
