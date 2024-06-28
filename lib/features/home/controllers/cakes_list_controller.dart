import 'package:get/get.dart';
import 'package:lola_app/data/models/cake_model.dart';

class CakesListController extends GetxController{
  List<CakeModel>? cakesList;

  String? categoryName;

  Map<String, dynamic>? args;

  @override
  void onInit() {
    // TODO: implement onInit
    args = Get.arguments;
    categoryName = args!['categoryName'];
    cakesList = args!['cakeList'];
    super.onInit();
  }
}