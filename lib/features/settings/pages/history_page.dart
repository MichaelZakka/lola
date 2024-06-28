import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/constants/app_colors.dart';
import 'package:lola_app/common/widgets/custom_appbar.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/common/widgets/no_data.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/settings/controllers/history_controller.dart';
import 'package:lola_app/features/settings/widgets/order_widget.dart';

class HistoryPage extends GetView<OrderHistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderHistoryController());
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Orders History',
          hasLeading: true,
        ),
        body: Obx(() {
          switch (controller.historyRequstStatus.value) {
            case RequestStatus.loading:
              return const CustomLoader();
            case RequestStatus.nodata:
              return const NoData(text: 'History is empty');
            case RequestStatus.success:
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.orders.length,
                  itemBuilder: (context, i) {
                    return OrderWidget(order: controller.orders[i]);
                  });
            case RequestStatus.onerror:
              return const NoData(text: 'Error Occured');
            default:
              return Container();
          }
        }));
  }
}
