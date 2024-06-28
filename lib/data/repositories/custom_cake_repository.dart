import 'package:dio/dio.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/providers/remote/api_provider.dart';
import 'package:lola_app/data/models/app_response.dart';
import 'package:lola_app/data/models/custom_cake_model.dart';

class CustomCakeRepository {
  Future<AppResponse> getShapes() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.shapesUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getFlavors() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.flavorsUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getColors() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.colorsUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getToppings() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.toppingsUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createCustomCake(CustomCakeModel customCake) async {
    var data = await customCake.toJson();
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createCustomCakeUrl,
        body: FormData.fromMap(data),
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> addCustomCakeToCart(CustomCakeModel customCake) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.addCustomCakeToCartUrl,
        body: customCake.customCakeToCartJson(),
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
