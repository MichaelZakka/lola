import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/widgets/loader.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';
import 'package:lola_app/features/home/widgets/category_widget.dart';
import 'package:lola_app/features/home/widgets/home_top_layout.dart';
import 'package:lola_app/features/home/widgets/make_your_own_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeTopLayout(),
            SizedBox(
              height: 20.h,
            ),
            const MakeYourOwnWidget(),
            SizedBox(
              height: 22.h,
            ),
            Obx(() {
              switch (controller.homeReqStatus.value) {
                case RequestStatus.begin:
                  return Container();
                case RequestStatus.loading:
                  return const CustomLoader();
                case RequestStatus.noInternet:
                  return Container();
                case RequestStatus.nodata:
                  return Container();
                case RequestStatus.onerror:
                  return Container();
                case RequestStatus.success:
                  return ListView.builder(
                      itemCount: controller.categories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return CategoryWidget(
                          categoryModel: controller.categories[index],
                          index: index,
                        );
                      }));
                default:
                  return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
