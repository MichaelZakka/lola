import 'package:dio/dio.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/providers/remote/api_provider.dart';
import 'package:lola_app/data/models/app_response.dart';

class OrderRepository {
  Future<AppResponse> createOrder() async {
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.orderUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getHistory() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.orderHistoryUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
