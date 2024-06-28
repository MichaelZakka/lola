import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/widgets/custom_appbar.dart';
import 'package:lola_app/features/home/controllers/cakes_list_controller.dart';
import 'package:lola_app/features/home/widgets/cake_widget.dart';

class CakesListPage extends GetView<CakesListController> {
  const CakesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CakesListController());
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.categoryName!,
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.sp,
              ),
              padding: REdgeInsets.all(15),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.cakesList!.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return CakeWidget(
                  cakeModel: controller.cakesList![i],
                  categoryName: controller.categoryName,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
