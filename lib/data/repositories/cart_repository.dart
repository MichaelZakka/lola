import 'package:dio/dio.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/providers/remote/api_provider.dart';
import 'package:lola_app/data/models/app_response.dart';

class CartRepository {
  Future<AppResponse> addCakeToCart(int cakeId) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.addToCartUrl,
        body: {'cake_id': cakeId.toString(), 'quantity': '1'},
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getCart() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.cartUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> removeCakeFromCart(String cakeId) async {
    try {
      var appResponse = await ApiProvider.delete(
        url: '${EndPoints.removeFromCartUrl}$cakeId',
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
