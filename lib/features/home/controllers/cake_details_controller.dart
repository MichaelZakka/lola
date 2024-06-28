import 'package:get/get.dart';
import 'package:lola_app/data/models/cake_model.dart';

class CakeDetailsController extends GetxController {
  CakeModel? cake;

  String? categoryName;

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String, dynamic> args = Get.arguments;
    cake = args['cakeModel'];
    categoryName = args['categoryName'];
    super.onInit();
  }
}
