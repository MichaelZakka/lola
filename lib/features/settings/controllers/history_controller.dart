import 'package:get/get.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/order_model.dart';
import 'package:lola_app/data/repositories/order_repository.dart';

class OrderHistoryController extends GetxController {
  final OrderRepository _orderRepo = OrderRepository();

  var historyRequstStatus = RequestStatus.begin.obs;

  List<OrderModel> orders = [];

  getHistory() async {
    historyRequstStatus(RequestStatus.loading);
    final response = await _orderRepo.getHistory();
    if (response.success) {
      print(response.data);
      orders =
          (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
      if (orders.isEmpty) {
        historyRequstStatus(RequestStatus.nodata);
      } else {
        historyRequstStatus(RequestStatus.success);
      }
    } else {
      historyRequstStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getHistory();
    super.onInit();
  }
}
